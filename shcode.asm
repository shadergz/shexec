; This is a shellcode example

%define SYS_EXECVE 59

BITS 64
; execve ("./hw", ["./hw", NULL], NULL);
; ./mw

;  envp = NULL
push rbp
mov rsp, rsp
sub rsp, 32

; envp = NULL
mov rdx, 0

; const char *argv[] = {"./hw", NULL};
mov rax, 0x776d2f2e
mov [rbp-8], rax
lea rdi, [rbp-8]
mov QWORD [rbp-16], 0
mov [rbp-24], rdi
lea rsi, [rbp-24]

; pathname = argv[0]

xor rax, rax
add al, SYS_EXECVE
syscall

leave
ret
