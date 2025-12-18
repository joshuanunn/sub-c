int putchar(int c);

int main(void) {
    putchar(65);
    putchar(66, 67);  /* should be a compile error */
    return 0;
}
