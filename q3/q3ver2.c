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

scanf("%[^\n]%*c", str);
   fgets(str, N, stdin);

    int i = 0;
    while (i < N)
    {
        if (str[i] == ' ')
            i++;
        else if ((int)str[i] > 41 && (int)str[i] < 48)
        {
            if (i + 1 != N && isdigit(str[i + 1]))
            {
                array[count++] = (int)(str[i + 1]-'0') * (-1);
                i += 2;
            }
            else
            {
                array[count++] = (int) str[i];
                i++;
            }
        }
        else
        {
            array[count++] = (int)(str[i + 1]-'0');
            i++;
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