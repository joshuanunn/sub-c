int main(void) {
    int a;
    int b;

    a = 0;
    b = (a = 1, a = 2);

    return a * 10 + b;  /* should return 22 */
}
