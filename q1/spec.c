#include<stdio.h>
#include<stdlib.h>

extern long long int max_sub_sum(long long int *arr, long long size, long long minLen, long long maxLen, long long int* prefix_array);

int main(){
    long long N, L, R;
    scanf("%lld %lld %lld", &N, &L, &R);

    long long *arr = (long long *)malloc((N+1) * sizeof(long long));
    // long long *perfixSum = (long long *)malloc((N+1)* sizeof(long long));
    long long perfixSum[N+1];
    
    for(long long int i=0;i<N;i++)
        scanf(" %lld", &arr[i]);

    long long int out = max_sub_sum(arr, N, L, R, perfixSum);
    printf("%lld\n", out);
    
    return 0;
}