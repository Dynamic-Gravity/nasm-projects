section .data                               ;Data segment
    userMsg db 'Please enter a number: '    ;ask for input
    lenUserMsg equ $-userMsg                ;get length of input
    dispMsg db 'You have entered: '         ;the reply message
    lenDispMsg equ $-dispMsg                ;length of reply message

section .bss                                ;Uninitialized data
    num resb 5

section .text                               ;Code segement
    global _start

_start:                                     ;user prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 80h

    ;Read and store user's input
    mov eax, 3
    mov ebx, 2
    mov ecx, num
    mov edx, 5  ;5 bytes (numeric, 1 for sign) of the info
    int 80h

    ;Output the message 'The entered number is: '
    mov eax, 4
    mov ebx, 1
    mov ecx, dispMsg
    mov edx, lenDispMsg
    int 80h

    ;Output the number entered
    mov eax, 4
    mov ebx, 1
    mov ecx, num
    mov edx, 5
    int 80h

    ;Exit code
    mov eax, 1
    mov ebx, 0
    int 80h