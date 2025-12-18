int main(void) {
    int x;
    x = 4;
    return x = 1, x + 2;  /* should return 3 */
}
