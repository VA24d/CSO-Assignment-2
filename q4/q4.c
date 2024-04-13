#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#define pn printf("\n")

extern long long int baseball(long long N, long long *post, long long *blank);

/*
You are given a list of strings operations, where operations[i] is the ith operation you must apply to the record and is one of the following:
An integer x : Record a new score of x.
’+’ : Record a new score that is the sum of the previous two scores.
’D’: Record a new score that is the double of the previous score.
’C’ : Invalidate the previous score, removing it from the record.
Return the sum of all the scores on the record after applying all the operations
 */

int main()
{
    long long N;
    scanf("%lld", &N);

    if (N > -1)
    {
        long long arr[N];
        long long blank[N + 5];

        char a[5];
        for (int i = 0; i < N; i++)
        {
            scanf("%s", a);

            if (strlen(a) == 1)
            {
                if (a[0] == 'C')
                    arr[i] = 101;
                else if (a[0] == 'D')
                    arr[i] = 102;
                else if (a[0] == '+')
                    arr[i] = 103;
                else
                    arr[i] = atoi(a);
            }
            else
            {
                arr[i] = atoi(a);
            }
        }

        // for (int i=0; i<N; i++)
        // {
        //     printf("%lld ", blank[i]);
        // }
        // pn;



        long long out = baseball(N, arr, blank);

        // for (int i=0; i<N+2; i++)
        // {
        //     printf("%lld ", blank[i]);
        // }
        // pn;

        printf("%lld\n", out);
    }
    else
    {
        printf("0\n");
    }
    return 0;
}