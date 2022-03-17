.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
msg1 BYTE "Enter 10 integers:",0dh,0ah,0
msg2 BYTE "positive integers:",0dh,0ah,0
msg3 BYTE "negative integers:",0dh,0ah,0
countS DWORD 0
countNS DWORD 0
inputN DWORD ?
endl BYTE " ",0dh,0ah,0

.code
main PROC

;read 10 integers and count the positive ones and negative ones
call Clrscr
mov edx,offset msg1
call writestring


mov ecx,10

L1:
call readint;
mov inputN,eax;
cmp inputN,0
jl next

INC countNS;
jmp next2
next:
INC countS;

next2:
LOOP L1;


mov edx,offset msg2
call writestring
mov eax,countNS;
call writeInt

mov eax,0
mov edx,offset endl
call writestring

mov edx,offset msg3
call writestring
mov eax, countS;
call writeInt


exit

INVOKE EXITProcess ,eax

main ENDP

END main 