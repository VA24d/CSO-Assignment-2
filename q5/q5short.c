#include "stdio.h"
#include "stdlib.h"

extern short bin_s(short *arr, short value, short l, short r, long long *itr);

int main()
{

    short array[32];

    for (int i = 0; i < 32; i++)
    {
        scanf("%hd", &array[i]);
    }

    short value;
    scanf("%hd", &value);

    // printf("out\n");
    long long itr = 0;
    long long *pitr = &itr;

    short out = bin_s(array, value, 0, 31, pitr);

    printf("%hd %lld\n", out, *pitr);

    return 0;
}