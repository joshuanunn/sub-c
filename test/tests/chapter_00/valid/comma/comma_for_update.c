int main(void) {
    int i;
    int j;
    int sum;

    sum = 0;
    j = 0;

    for (i = 0; i < 5; i = i + 1, j = j + 2)
        sum = sum + j;

    return sum;  /* 0+2+4+6+8 = 20 */
}
