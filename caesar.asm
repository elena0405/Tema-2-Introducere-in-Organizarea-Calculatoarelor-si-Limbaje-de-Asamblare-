%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher

    mov ebx, 0

while:
    mov al, byte [esi + ebx]
    cmp eax, 64
    jle next_instruction_1
    cmp eax, 91
    jge next_instruction_2

    add eax, edi
    cmp eax, 90
    jle next_instruction_1

minimise_1:
    sub eax, 26
    cmp eax, 90 
    jg minimise_1
    
    jmp next_instruction_1   

next_instruction_2:
    cmp eax, 96
    jle next_instruction_1

    cmp eax, 123
    jge next_instruction_1

    add eax, edi
    cmp eax, 122
    jle next_instruction_1

minimise_2:
    sub eax, 26
    cmp eax, 122
    jg minimise_2

next_instruction_1:
    mov byte [edx + ebx], al

    add ebx, 1
    cmp ebx, ecx
    jl while

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY