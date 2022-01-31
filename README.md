# shexec

A simple shellcode example program

This demonstration is based in 3 stages, the firt one is that the shell code is compiled to a pure x86_64 CPU opcodes and saved to a file, the second stage the shellcode is loaded by the shload program that will map the current shellcode opcodes into memory and mark the memory region as 'executable' and 'readable' and a forced jump is made to this memory region, the third stage is the malware program loaded by the shell code

> How the memory mapping process is did:

```c
scfunc_t call_sc;

unsigned char *shell_code = mmap (NULL, shs.st_size, PROT_EXEC | PROT_READ, MAP_PRIVATE, fd, 0);
call_sc = (scfunc_t)shell_code;

call_sc ();
```
