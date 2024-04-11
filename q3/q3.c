#include "stdio.h"
#include "stdlib.h"

extern long long int eval_postfix(long long N,long long* post);

// 42  * 	asterisk
// 43  + 	plus
// 44  , 	comma
// 45  - 	minus
// 46  . 	period
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


    long long out = eval_postfix(count, array);

    printf("%lld\n", out);
    return 0;
}