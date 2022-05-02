import logging
from concurrent import futures

import grpc
import twophase_pb2
import twophase_pb2_grpc

logger = logging.getLogger(__name__)


class MyCoordinator(twophase_pb2_grpc.CoordinatorServicer):
    def __init__(self, log, worker_stubs):
        self._log = log
        self._worker_stubs = worker_stubs
        self._id = 0;
        # TODO: add recovery code here when two-phase commit is implemented
        if(self._log.get_last_entry() == None):
            # no log found, therefore this is new
            print("No log entry found");
        else:
            self._id = self._log.get_last_entry()['id'];
            self._message = twophase_pb2.MaybeValue(
                available=self._log.get_last_entry()['available'],
                content=self._log.get_last_entry()['content'],
                id=self._id
            );
            status = self._log.get_last_entry()['status'];
            if(status == 'committing'):
                # Finalize commit to workers
                self.commit();
            elif(status == 'preparing'):
                self.SetValue(self._message, None);
                
    def SetValue(self, request, context):
        self.Prepare(request, context);
        return twophase_pb2.Empty() 

    def Prepare(self, request, context):
        # start new transaction
        self._id += 1;

        # save to log for recovery
        self._log.set_last_entry({
            # metadata
            'id':self._id,
            'status':'preparing',
            # MaybeValue data
            'available':request.available,
            'content':request.content
        })

        # transaction data prep for new transaction
        self._message = twophase_pb2.MaybeValue(
            available=request.available,
            content=request.content,
            id=self._id
        );

        # get votes from workers
        for worker_stub in self._worker_stubs:
            worker_stub.Vote(self._message);
        
        # if we get here without aborts, all workers have committed
        # save to log for recovery
        self._log.set_last_entry({
            # metadata
            'id':self._id,
            'status':'committing',
            # MaybeValue data
            'available':request.available,
            'content':request.content
        })
        self.commit();
    
    def commit(self):
        # Finalize commit to workers
        for worker_stub in self._worker_stubs:
            worker_stub.SetValue(self._message);


def create_coordinator(coordinator_log, worker_stubs, **extra_args):
    # trunk-ignore(flake8/E501)
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=1, **extra_args))
    twophase_pb2_grpc.add_CoordinatorServicer_to_server(
        MyCoordinator(coordinator_log, worker_stubs), server
    )
    return server


if __name__ == "__main__":
    import argparse
    import os
    import time

    import persistent_log

    parser = argparse.ArgumentParser(description="Run the coordinator server.")
    parser.add_argument("server_address")
    parser.add_argument("log_file")
    parser.add_argument("worker_addresses", nargs="+")
    args = parser.parse_args()
    log = persistent_log.FilePersistentLog(args.log_file)
    worker_stubs = [
        twophase_pb2_grpc.WorkerStub(grpc.insecure_channel(address))
        for address in args.worker_addresses
    ]
    server = create_coordinator(log, worker_stubs)
    server.add_insecure_port(args.server_address)
    server.start()
    while True:
        time.sleep(3600)
