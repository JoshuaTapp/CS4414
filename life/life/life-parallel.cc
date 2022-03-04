#include "life.h"
#include <pthread.h>

pthread_mutex_t lock;
pthread_barrier_t barrier;

// Source: Arpaci-Dusseau
struct myarg_t {
    std::vector<LifeBoard> states;
    int thread_rows;
    int row_multiple;
    bool* even;
    int steps;
};


void* updateGridSection(void* args);

void simulate_life_parallel(int threads, LifeBoard &state, int steps) {
    /* 
    
    */
    pthread_mutex_lock(&lock);
    pthread_barrier_init(&barrier, NULL, threads);
    // Odd and Even states. Set even state to inital state provided by function
    std::vector<LifeBoard> states;
    states.reserve(2);
    states.push_back(state);
    LifeBoard next_state{state.width(), state.height()};
    states.push_back(next_state);
    std::vector<pthread_t> tids;
    tids.reserve(threads);
    std::vector<myarg_t> args;
    args.reserve(threads);

    //int ret = pthread_mutex_init(&lock, NULL);
    //assert(ret = 0);
    /*
    TODO: Fix rows_per_thread to deal with edges
    */
    // Determine rows per thread before creating threads
    int rows_per_thread = 0;
    if((state.height() / threads) == 0) {
        rows_per_thread = state.height();
    }
    else {
        rows_per_thread = state.height() / threads;
    }

    // even or odd step?
    bool even = true;
    
    for(int i = 0; i < threads; ++i) {
        myarg_t temp = {states, rows_per_thread, i, &even, steps};
        args.push_back(temp);

    }

    for(int i = 0; i < threads; ++i) {
        pthread_create(&tids.at(i), NULL, updateGridSection, &args.at(i)); 
    }
    for (int step = 0; step < steps; ++step) {
        pthread_barrier_wait(&barrier); // wait for everyone to finish updating state+1
        pthread_mutex_lock(&lock);
        state = states.at((step + 1) % 2); // change current state to next state and continue simulation
        pthread_mutex_unlock(&lock);
    }
}


void* updateGridSection(void* args) {
    myarg_t* params = (myarg_t*) args;
    int stateIndex = (*params->even == true) ? 0 : 1;
    
    for (int step = 0; step < params->steps; ++step) {
        // Row Loop
        for (int y = 1 + (params->thread_rows * params->row_multiple); 
            y < params->states.at(stateIndex).height() - 1 &&
            y < 1 + (params->thread_rows * (params->row_multiple + 1));
            ++y) 
        {
            // Column loop
            for (int x = 1; x < params->states.at(stateIndex).width() - 1; ++x) {
                int live_in_window = 0;
                /*  For each cell, examine a 3x3 "window" of cells around it,
                    and count the number of live (true) cells in the window. */
                for (int y_offset = -1; y_offset <= 1; ++y_offset) {
                    for (int x_offset = -1; x_offset <= 1; ++x_offset) {
                        if (params->states.at(stateIndex).at(x + x_offset, y + y_offset)) {
                            ++live_in_window;
                        }
                    }
                }
                params->states.at((stateIndex + 1) % 2).at(x, y) = (
                        live_in_window == 3 /* dead cell with 3 neighbors or live cell with 2 */ ||
                        (live_in_window == 4 && params->states.at(stateIndex).at(x, y)) /* live cell with 3 neighbors */
                    );
            }
        }
        pthread_barrier_wait(&barrier);
    }
    return nullptr;
}