extern terminal_write

section .text
sys.terminal_write:
    push rbp
    mov rbp, rsp

    and rsp, 0xfffffffffffffff0
    mov rdi, [rbp + 0x10]
    mov rsi, [rbp + 0x18]
    call terminal_write

    mov rsp, rbp
    pop rbp
    ret

section .text
done:
    hlt
    jmp done

section .text
__dump:
    ret

section .text
__fatal:
    hlt

extern main

section .text
global _start
_start:
    call main
    jmp done
