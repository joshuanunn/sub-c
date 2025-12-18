int main(void) {
    int x;
    x = 0;

    return x ? 1 : (x = 2, x + 1);  /* should return 3 */
}
