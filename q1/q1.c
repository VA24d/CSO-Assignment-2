#include "stdio.h"
#include "stdlib.h"

extern long long int max_sub_sum(long long int *arr, long long size, long long minLen, long long maxLen);

int main()
{
    long long N, L, R;
    scanf("%lld %lld %lld", &N, &L, &R);

    long long *arr = (long long *)malloc(N * sizeof(long long));
    // long long *perfixSum = (long long *)malloc(N * sizeof(long long));

    for (int i = 0; i < N; i++)
    {
        scanf("%lld", &arr[i]);
    }
    printf("%p\n", arr);

    long long maxSubSum = max_sub_sum(arr, N, L, R);

    for (int i = 0; i < N; i++)
        printf("%lld ", arr[i]);
    printf("\n");

    printf("%lld\n", maxSubSum);
    return 0;
}