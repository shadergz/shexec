#include <stdio.h>
#include <unistd.h>

int main (void)
{
    printf ("%s", "Deleting root directory Goodbye");
    fflush (stdout);
    for (int i = 0; i <= 3; i++) {
        sleep (2);
        printf ("%s", ".");
        fflush (stdout);
    }
    printf ("\nDon't enter in panic, this is just a joking :)\n");
}
