.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
arr dword 0,1,1,2,3,5,8,13,21
msg1 BYTE " a fibonacci", 0dh, 0ah, 0
msg2 BYTE " not a fibonacci", 0dh, 0ah, 0

.code
main PROC

call isFibonacci;

jmp fin;
isFibonacci PROC
mov ecx, (LENGTHOF arr) - 2
 mov esi, OFFSET arr; esi points to the first element
 mov edi, OFFSET arr; edi points to the second element 
 add edi, 8

xor eax,eax;zero the eax reg
check:

mov eax, [esi]
add esi, 4;
add eax, [esi]
cmp eax, [edi];check if element is the equal to sum of previous 2
jne notfib

add edi, 4
loop check;

fib:
mov edx, offset msg1
jmp writemsg


notfib:
mov edx, offset msg2


writemsg:
call WriteString

ret;
isFibonacci ENDP

fin:
exit
INVOKE EXITProcess ,eax
main ENDP
END main
