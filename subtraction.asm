; Marita Brichan #ID 40138194
; SOEN 228 section U (UA for tutorial and A-X for lab)
section .data


X db 15
Y  db 4
counter db 0

section .bss

quotient resb 1
remainder resb 1

section .text
        global _start

_start:
        cmp byte [Y] , 0       ; compare divisor with 0,
        je end                 ; if it's equal to 0, then the division is not valid, so just skip to the end to exit the program
        mov al, [X]            ; Assign al the value of X
        mov bl, [Y]            ; Assign bl the value of Y
        mov cl, [counter]      ; Assign cl the calure of the couner
loop:
        cmp al, bl             ; if X < Y then the subtraction result will be negative
        jl done                ; if so skip to done since now the X is the remainder
        inc cl                 ; increment the quotient counter
        sub al, bl             ; subtract the Y from current X
        cmp al, bl             ; if X=Y, then the subtraction is equal to 0 with no remainder
        je done                ; if so skip to done since the counter is now the quotient and remainder should be 0
        jmp  loop              ; go back to the beginning of the loop
done:   mov [quotient] , cl    ; Assign quotient the value of cl, which is the counter
        mov [remainder], al    ; Assign remainder the value of al, which is what is left of the division

end:
        mov eax,1             ; The system call for exit (sys_exit)
        mov ebx,0             ; Exit with return code of 0 (no error)
        int 80h
