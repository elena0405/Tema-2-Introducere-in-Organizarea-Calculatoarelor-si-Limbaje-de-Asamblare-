%include "io.mac"

section .text
    global bin_to_hex
    extern printf

section .data
    putere_a_lui_2 db 0

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement bin to hex

    xor eax, eax     ; contor pentru sirul bin_sequence
    xor ebx, ebx     ; contor pentru sirul hexa_value

;while:
 ;   xor edi, edi     ; aici retin sirul de 4 biti din baza 2 convertit in baza 10
  ;  move al, 1
;putere_a_lui_2:
 ;   mov bl, 2
  ;  mul bl
   ; add edi, 1
    ;cmp edi, byte [esi]
    ;jl putere_a_lui_2
    ;jge 

;conversie:
 ;   mov bl, byte [esi + ebx]
  ;  jmp putere_a_lui_2
;suma:
 ;   add byte [edi], al
  ;  add edi, 1


    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY