#include "stdio.h"
#include "stdlib.h"

extern long long int max_sub_sum(long long int *arr, long long size, long long minLen, long long maxLen);

long long int max_sub_sum2(long long int *arr, long long size, long long minLen, long long maxLen)
{
    int i = 0;

    int cur_max = 0;
    int cur_sum = 0;
    int cur_len = 0;

    while (i < minLen)
    {
        cur_max += arr[i++];
        cur_len++;
    }

    cur_sum = cur_max;

    while (i < size)
    {
        if (arr[i] < 0)
        {
            i++;
            cur_sum = 0;
            cur_len = 1;
            continue;
        }
        if (cur_len >= minLen)
        {
            if (cur_len > maxLen)
            {
                i++;
                cur_sum = 0;
                cur_len = 1;
                continue;
            }

            if (cur_sum > cur_max)
            {
                cur_max = cur_sum;
            }
            
            cur_sum+=arr[i];
            i++;
            cur_len++;
        }
        else
        {
            cur_sum += arr[i];
            i++;
            cur_len++;
        }
    }

    return cur_max;
}

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

    int maxSubSum = max_sub_sum2(arr, N, L, R);

    for (int i = 0; i < N; i++)
        printf("%lld ", arr[i]);
    printf("\n");

    printf("%d\n", maxSubSum);
    return 0;
}