int main(void) {
    int x;
    x = 1;

    return x++, x++, x;  /* should return 3 */
}
