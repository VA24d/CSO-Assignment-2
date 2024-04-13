#include <stdio.h>
#include "limits.h"

// #define INF 1000000000

int max(int a, int b) {
    return (a > b) ? a : b;
}

int maxSubarraySum(int N, int L, int R, int arr[]) {
    // Step 1: Compute prefix sum
    int prefixSum[N];
    prefixSum[0] = arr[0];
    for (int i = 1; i < N; i++) {
        prefixSum[i] = prefixSum[i - 1] + arr[i];
    }

    // Step 2: Initialize variables
    int maxSum = -INT_MAX;
    int currentSum = 0;
    int leftIndex = 0;

    // Step 3: Sliding window algorithm
    for (int rightIndex = 0; rightIndex < N; rightIndex++) {
        // Update current sum by adding the new element
        currentSum += arr[rightIndex];

        // If window size exceeds R, shrink the window from the left
        while (rightIndex - leftIndex + 1 > R) {
            currentSum -= arr[leftIndex];
            leftIndex++;
        }

        // If window size is within the range [L, R], update maxSum
        if (rightIndex - leftIndex + 1 >= L) {
            maxSum = max(maxSum, currentSum);
        }

        // If window sum becomes negative, reset currentSum
        if (currentSum < 0) {
            currentSum = 0;
        }
    }

    // Step 5: Return the maximum sum found
    return maxSum;
}

int main() {
    int N, L, R;
    scanf("%d %d %d", &N, &L, &R);

    int arr[N];
    for (int i = 0; i < N; i++) {
        scanf("%d", &arr[i]);
    }

    int result = maxSubarraySum(N, L, R, arr);
    printf("%d\n", result);

    return 0;
}
