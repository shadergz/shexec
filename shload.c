#include <assert.h>
#include <unistd.h>
#include <fcntl.h>

#include <sys/stat.h>
#include <sys/mman.h>

/* The function prototype used to call the shcode object */

typedef void (*scfunc_t)(void);

int main (void)
{
    /* Loading the shell code */
    int fd = open ("shcode", O_RDONLY);
    struct stat shs;
    assert (fd != -1);
    scfunc_t call_sc;

    fstat (fd, &shs);

    /*  This map will be automatically destroyed after the new image process overwrite
     *  the current process (the malware program) 
    */
    unsigned char *shell_code = mmap (NULL, shs.st_size, 
        /* Provide execution and read capabilities to the new map region */
        PROT_EXEC | PROT_READ, 
        /* Does not share this memory bound */
        MAP_PRIVATE,
        /* Initializing the memory region with the content of the file pointed by the descriptor */
        fd, 0);
    /* After the mmap returns, the file descriptor can be close
     * without to modify the mapped address 
    */
    close (fd);
    call_sc = (scfunc_t)shell_code;

    call_sc ();
}
