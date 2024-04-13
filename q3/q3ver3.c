#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "ctype.h"
#define pn printf("\n")

extern long long int eval_postfix(long long N, long long *post);

// 42  * 	asterisk
// 43  + 	plus
// 45  - 	minus
// 47  / 	slash

int main()
{
    long long N;
    scanf("%lld", &N);

    char str[N + 1];
    long long array[N];
    int count = 0;

    int i = 0;

    while (i < N)
    {
        scanf("%s", str);
        // printf("%s\n", str);
        if ((int)str[0] > 41 && (int)str[0] < 48)
        {
            if (i + 1 != N && isdigit(str[1]))
            {
                array[count++] = (int)(str[1] - '0') * (-1);
                i += strlen(str) + 1;
            }
            else
            {
                array[count++] = (int)str[0];
                i += strlen(str) + 1;
            }
        }
        else
        {
            array[count++] = (int)(str[0] - '0');
            i += strlen(str) + 1;
        }
    }

    for (int i = 0; i < count; i++)
    {
        printf("%lld ", array[i]);
    }
    pn;

    long long out = eval_postfix(count, array);

    printf("%lld\n", out);
    return 0;
}