#include "stdio.h"
#include "stdlib.h"


extern long long int bin_s(long long N,long long* post, long long* int);


int main()
{
    long long N;
    scanf("%lld", &N);

    long long array[N];

    for (int i = 0; i < N; i++)
    {
        scanf("%lld", &array[i]);

    }
    int itr=0;

    int *pitr=&itr;

    long long out = baseball(N, array, pitr);

    printf("%lld %lld\n", out, *pitr);
    
    return 0;
}