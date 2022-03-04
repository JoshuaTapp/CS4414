#include "life.h"
#include <pthread.h>

pthread_mutex_t lock;
pthread_barrier_t barrier;

void updateCell(int x, int y);

void simulate_life_parallel(int threads, LifeBoard &state, int steps) {
    /* YOUR CODE HERE */
    LifeBoard states[2];
    pthread_mutex_init(&lock, NULL);
    pthread_barrier_init(&barrier, NULL, threads);
    states[0] = state;
    pthread_t tids[threads];
    
    for (int step = 0; step < steps; ++step) {
        /* We use the range [1, width - 1) here instead of
         * [0, width) because we fix the edges to be all 0s.
         */
        for (int y = 1; y < state.height() - 1; ++y) {
            for (int x = 1; x < state.width() - 1; ++x) {
                int live_in_window = 0;
                /* For each cell, examine a 3x3 "window" of cells around it,
                 * and count the number of live (true) cells in the window. */
                for (int y_offset = -1; y_offset <= 1; ++y_offset) {
                    for (int x_offset = -1; x_offset <= 1; ++x_offset) {
                        if (state.at(x + x_offset, y + y_offset)) {
                            ++live_in_window;
                        }
                    }
                }
                /* Cells with 3 live neighbors remain or become live.
                   Live cells with 2 live neighbors remain live. */
                next_state.at(x, y) = (
                    live_in_window == 3 /* dead cell with 3 neighbors or live cell with 2 */ ||
                    (live_in_window == 4 && state.at(x, y)) /* live cell with 3 neighbors */
                );
            }
        }
        
        /* now that we computed next_state, make it the current state */
        swap(state, next_state);
    }
}