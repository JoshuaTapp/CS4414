#include "life.h"
#include <pthread.h>
#include <vector>
#include <cstdio>


struct point {
    int x;
    int y;

    point(int a, int b) : x(a), y(b){}
};


// Source: Arpaci-Dusseau
struct myarg_t {
    LifeBoard* state;
    LifeBoard* next_state;
    int cells;
    point start;
    int steps;
    pthread_barrier_t* barrier;

    myarg_t(LifeBoard* a, LifeBoard* b, int c, point s,  int step, pthread_barrier_t* f)
        : state(a), next_state(b), cells(c), start(s), steps(step), barrier(f){}

};


void* updateGridSection(void* args);
void findThreadPoint(int cell_length, int width, int height, std::vector<point> &points);

void simulate_life_parallel(int threads, LifeBoard &state, int steps) {
    pthread_barrier_t barrier;
    pthread_barrier_init(&barrier, NULL, threads+1);
    // Odd and Even states. Set even state to inital state provided by function
    LifeBoard next_state{state.width(), state.height()};
    std::vector<pthread_t> tids;
    std::vector<myarg_t> args;
    std::vector<point> points;

    // cells per thread
    int grid_cells = (state.height()-2)*(state.width()-2);
    int normal_load;

    /*  If our total grid cells is too small
        then we should not use all the threads
        because of the thread overhead.     */
    if(threads >= grid_cells) {
        threads = grid_cells;
        normal_load = 1;
    }
    else {
        normal_load = grid_cells / threads;
    }


    //int start_cell = state.width() + 1;
    for(int i = 0; i < threads; ++i) {
        pthread_t t = 0;
        tids.push_back(t);

    }
    
    findThreadPoint(normal_load, state.width(), state.height(), points);
    for(point p : points) {
        args.emplace_back(&state, &next_state, normal_load, p, steps, &barrier);
    }


    for(int i = 0; i < threads; ++i) {
        //printf("Thread: %d\n", i);
        int rtn = pthread_create(&tids.at(i), NULL, updateGridSection, (void*) &args.at(i)); 
        if(rtn){
            printf("Failed pthread_create: %i\n", rtn);
            exit(-1);

        }
    }
    for (int step = 0; step < steps; ++step) {
        pthread_barrier_wait(&barrier); // wait for everyone to finish updating state+1
        swap(state, next_state);  // change current state to next state and continue simulation
        pthread_barrier_wait(&barrier);
    }

    for (int i = 0; i < threads; i++) {
      pthread_join(tids[i], NULL);
    }
    pthread_barrier_destroy(&barrier);
}


void* updateGridSection(void* args) {
    struct myarg_t* params = (struct myarg_t*) args;
    LifeBoard *state = params->state;
    LifeBoard *next_state = params->next_state;
    int cells = params->cells;
    int steps = params->steps;
    point start = params->start;
    //point end = params->end;
    pthread_barrier_t *barrier = params->barrier;

    for (int step = 0; step < steps; ++step) {
        int flag = 0;
        int cells_computed = 0;
        //printf("starting point: %i,%i\n", start.x, start.y);
        
        for (int y = start.y;  y < state->height() - 1; ++y) {
            int x = 1;
            if(y == start.y ) x = start.x;
            for (; x < state->width() - 1; ++x) {
                int live_in_window = 0;
                
                for (int y_offset = -1; y_offset <= 1; ++y_offset) {
                    for (int x_offset = -1; x_offset <= 1; ++x_offset) {
                        
                        if (state->at(x + x_offset, y + y_offset)) {
                            ++live_in_window;
                        }
                    }
                }
                /* dead cell with 3 neighbors or live cell with 2 */
                /* live cell with 3 neighbors */
                next_state->at(x, y) = (live_in_window == 3  || (live_in_window == 4 && state->at(x, y)));
                cells_computed++;

                if(cells_computed == cells) {
                    pthread_barrier_wait(barrier);
                    pthread_barrier_wait(barrier);
                    flag = 1;
                }
            }
        if(flag == 1) break;
        }
    }
    return nullptr;
}
 
void findThreadPoint(int cell_length, int width, int height, std::vector<point> &points) {

    int count = 0;
    for (int y = 1;  y < height - 1; ++y) {
        for (int x = 1; x < width - 1; ++x) {
            if(count % cell_length == 0) {
                points.emplace_back(point (x,y));
            }
            count++;
        }
    }
}