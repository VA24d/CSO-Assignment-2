extern long long int bin_s(long long *arr, long long value, long long l, long long r, long long *itr)
{
    while (l < r)
    {
        if (r - l < 2)
        {
            return arr[l] == value ? l : arr[r] == value ? r : -1;
        }

        long long mid = (l + r) / 2;

        *itr += 1;

        if (arr[mid] >= value)
        {
            r = mid;
        }
        else
        {
            l = mid+1;
        }
    }
}