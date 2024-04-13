#include "stdio.h"
#include "stdlib.h"

extern long long int bin_s(long long *arr, long long value, long long l, long long r, long long *itr);

int main()
{
    long long N, value;
    // scanf("%lld", &N);

    long long array[32];

    for (int i = 0; i < 32; i++)
    {
        scanf("%lld", &array[i]);
    }

    scanf("%lld", &value);

    // printf("out\n");
    long long itr = 0;
    long long *pitr = &itr;

    long long out = bin_s(array, value, 0, 31, pitr);

    printf("%lld %lld\n", out, *pitr);

    return 0;
}