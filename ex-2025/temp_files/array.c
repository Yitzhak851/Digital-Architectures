#include <stdio.h>
int sum(int **a, int nrows, int ncols)
{
    int i, j, sum = 0;
    for (i = 0; i < nrows; ++i)
        for (j = 0; j < ncols; ++j)
            sum += a[i][j];
    return sum;
}

int main()
{
    int example_array[] = {3, 2, 5, 4};
    printf("Sum of array is: %d\n", sum(array, 3, 4));
    return 0;
}