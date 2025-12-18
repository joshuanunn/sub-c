int main(void) {
    int x;
    int y;

    x = 0;
    y = 0;

    x = 1, y = 2, x = x + y;

    return x * 10 + y;  /* should return 32 */
}
