import logging
from concurrent import futures

import grpc
import twophase_pb2
import twophase_pb2_grpc

logger = logging.getLogger(__name__)


class MyWorker(twophase_pb2_grpc.WorkerServicer):
    def __init__(self, log):
        self._log = log
        self._content = None
        self._id = 0
        # recovery 
        if self._log.get_last_entry() != None:
            self._available = self._log.get_last_entry()['available']; 
            self._content = self._log.get_last_entry()['content'];
            self._id = self._log.get_last_entry()['id'];
            
    def SetValue(self, request, context):
        # check transaction id to prevent disjunction
        if(request.id != self._id):
            context.abort(grpc.StatusCode.INTERNAL, 'Abort: mismatch of ids')

        self._available = True;
        self._log.set_last_entry({
            'available':self._available,
            'content':request.content,
            'id':self._id
        });
        # finalize commit
        self._content = request.content;
        return twophase_pb2.Empty();

    def GetCommitted(self, request, context):
        return twophase_pb2.MaybeValue(
            available=self._available,
            content=self._content,
        )
    def Vote(self, request, context):
        # check transaction id to prevent disjunction
        if(request.id < self._id):
            context.abort(grpc.StatusCode.INTERNAL, 'Abort: mismatch of ids')
        
        # Passed check, vote Commit
        self._available = False;
        self._content = request.content;
        self._id = request.id;

        # save to log in case of failure
        self._log.set_last_entry({
            'available':self._available,
            'content':self._content,
            'id':self._id
        });

        # Voted commit, Saved to Log, return to signal vote
        return twophase_pb2.Empty(); 




def create_worker(worker_log, **extra_args):
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=1), **extra_args)
    twophase_pb2_grpc.add_WorkerServicer_to_server(MyWorker(worker_log), server)
    return server


if __name__ == "__main__":
    import argparse
    import os
    import time

    import persistent_log

    parser = argparse.ArgumentParser(description="Run a worker")
    parser.add_argument("server_address")
    parser.add_argument("log_file")
    args = parser.parse_args()
    log = persistent_log.FilePersistentLog(args.log_file)
    server = create_worker(log)
    server.add_insecure_port(args.server_address)
    server.start()
    while True:
        time.sleep(3600)
