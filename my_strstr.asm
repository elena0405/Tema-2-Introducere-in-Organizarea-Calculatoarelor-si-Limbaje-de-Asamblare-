%include "io.mac"

section .text
    global my_strstr
    extern printf

section .data
    needle_len dd 0
    haystack_len dd 0

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr

    add ecx, 1
    mov [edi], ecx
    sub ecx, 1
    mov [needle_len], edx
    mov [haystack_len], ecx          
    xor ecx, ecx               ; contor pentru sirul haystack
    xor edx, edx               ; contor pentru sirul needle

while:
    mov [edi], ecx

probably_found_str:
    mov al, byte [ebx + edx * 1]
    cmp al, byte [esi + ecx * 1]
    jne restore
    add edx, 1
    add ecx, 1
    cmp edx, [needle_len]
    jl probably_found_str
    jge succes

restore:
    xor edx, edx
    mov eax, [haystack_len]
    add eax, 1
    mov [edi], eax

move_forward:
    add ecx, 1
    cmp ecx, [haystack_len]
    jl while

succes: ;

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
