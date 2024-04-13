#include "stdio.h"
#include "stdlib.h"

extern long long int rec_combi(long long N, long long R);
// N to r+1 / n-r to 1

int main()
{
    long long N, R;
    scanf("%lld %lld", &N, &R);

    long long combi = rec_combi(N, R);

    printf("%lld\n", combi);
    return 0;
}