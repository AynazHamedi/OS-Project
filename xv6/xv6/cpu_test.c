#include "types.h"
#include "user.h"

void cpu_intensive_task(int task_id)
{
    int cnt;
    printf(1, "Task %d: Starting CPU-intensive task...\n", task_id);

    for (unsigned long long i = 0; i < 2e8 ; i++)
    {
        cnt+=i; 
    }

    printf(1, "Task %d completed.");
}
void memorytest(){
    int alloc_val = 510 * sizeof(char); // Allocate 510 bytes

    printf(1, "------------------------------------------\n");

    // Set memory quota to 1024 bytes
    if (set_mem_limit(1024) >= 0)
        printf(1, "Memory limit set to 1024 bytes.\n");
    else
        printf(1, "Memory limit could not be set.\n");

    // Allocate memory and test enforcement
    if (malloc(alloc_val))
        printf(1, "%d bytes were allocated.\n", alloc_val);
    else
        printf(1, "Allocation failed at %d bytes.\n", alloc_val);

    if (malloc(alloc_val))
        printf(1, "%d bytes were allocated.\n", alloc_val);
    else
        printf(1, "Allocation failed at %d bytes.\n", alloc_val);

    // This allocation should fail due to the memory quota
    if (malloc(alloc_val))
        printf(1, "%d bytes were allocated (unexpected).\n", alloc_val);
    else
        printf(1, "Allocation failed as expected (quota exceeded).\n");

    // printf(1, "------------------------------------------\n");
    exit() ; 
}
int main()
{
    int limit;
    int start_time, end_time;
    memorytest() ; 
    printf(1, "Testing CPU limits...\n");

    for (int i = 1; i <= 3; i++)
    {
        if (i == 1)
            limit = 90;
        else if (i == 2)
            limit = 60;
        else
            limit = 30;

        printf(1, "Setting CPU limit to %d%% for Task %d...\n", limit, i);

        cpu_limit(limit);

        start_time = uptime();
        cpu_intensive_task(i);
        end_time = uptime();

        printf(1, "Task %d completed with CPU limit %d%%. Time taken: %d ticks\n", i, limit, end_time - start_time);
    }

    exit();
}