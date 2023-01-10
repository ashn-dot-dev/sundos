default rel

; rbp + 0x28 => write: limine_terminal_write
; rbp + 0x20 => terminal: *limine_terminal
; rbp + 0x18 => start: *byte
; rbp + 0x10 => count: u64
section .text
call_limine_terminal_write:
    push rbp
    mov rbp, rsp

    mov rdi, [rbp + 0x20] ; terminal
    mov rsi, [rbp + 0x18] ; start
    mov rdx, [rbp + 0x10] ; count

    and rsp, 0xfffffffffffffff0
    call [rbp + 0x28] ; call write

    mov rsp, rbp
    pop rbp
    ret

section .text
done:
    hlt
    jmp done

section .text
__fatal:
    call done

section .text
global _start
_start:
    call main
    jmp done
