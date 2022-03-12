%include "io.mac"

section .text
    global vigenere
    extern printf
    
section .data
    key_len dd 0
    plaintext_len dd 0
    var dd 0

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     ecx, [ebp + 16]     ; plaintext_len
    mov     edi, [ebp + 20]     ; key
    mov     ebx, [ebp + 24]     ; key_len

    ;; DO NOT MODIFY
    ;; TODO: Implement the Vigenere cipher

   mov [key_len], ebx
   mov [plaintext_len], ecx
   mov eax, 0
   mov ebx, 0
   mov ecx, 0

   ;PRINTF32 `%x\n\0x`, byte [key_len]
   ;PRINTF32 `%d\n\x0`, byte [plaintext_len]

while:
    mov al, [edi + ebx]
    sub al, 65
    mov byte [var], al
    mov eax, 0
    mov al, [esi + ecx]

    cmp eax, 65
    jl is_not_letter

    cmp eax, 90
    jg probably_lower_case
    add eax, [var]

    cmp eax, 90
    jle add_letter

minimise_upper_case:
    sub eax, 26 
    cmp eax, 90
    jg minimise_upper_case
    jmp add_letter

probably_lower_case:
    cmp eax, 97
    jl is_not_letter
    cmp eax, 122
    jg is_not_letter
    add eax, [var]
    cmp eax, 122
    jle add_letter

minimise_lower_case: 
    sub eax, 26
    cmp eax, 122
    jg minimise_lower_case
    jmp add_letter

is_not_letter:
     mov byte [edx + ecx], al
     add ecx, 1
     jmp final_instruction

add_letter:
    mov byte [edx + ecx], al
    add ecx, 1
    add ebx, 1
    cmp ebx, [key_len]
    jge restore
    jmp final_instruction

restore:
    xor ebx, ebx

final_instruction:
    cmp ecx, [plaintext_len]
    jl while

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY