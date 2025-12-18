int main(void) {
    int x;
    int y;

    x = 1;
    y = 2;

    return (x += 1, y *= 3, x + y);  /* (2, 6) → 8 */
}
