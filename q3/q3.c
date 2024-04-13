#include "stdio.h"
#include "stdlib.h"
#define pn printf("\n")


extern long long int eval_postfix(long long N,long long* post);

// 42  * 	asterisk
// 43  + 	plus
// 45  - 	minus
// 47  / 	slash

int main()
{
    long long N;
    scanf("%lld", &N);

    long long array[N];
    int count = 0;

    char a;
    for (int i = 0; i < N; i++)
    {
        scanf("%c", &a);
        if (a==(char)10)
        {
            i--;
            continue;
        }
        if (a==' ')
            continue;
        else
        {
            if ((int)a > 41 && (int)a < 48)
                array[count++] = (int)a;
            else
                array[count++] = (int)a - 48;
        }
    }

    for (int i=0; i<count; i++)
    {
            printf("%lld ", array[i]);
    }
    pn;
    
    long long out = eval_postfix(count, array);

    printf("%lld\n", out);
    return 0;
}