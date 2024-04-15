prefix

int tmax = -llmax;
for(int i=a; i<=b; i++)
{
    int max = prefix [a];
    for(int j=1; j<n-i+1; j++ )
    {
        if (prefix[j+i]-prefix[j]>max)
        {
            max= prefix[j+i]-prefix[j];
        }
    }
    if (max>tmax)
        tmax=max;
}