.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
myMessage1 BYTE "Enter the dimension n of the square: ", 0dh, 0ah, 0
star BYTE "* ",0
endl BYTE " ",0dh,0ah,0
inputN DWORD ?
count DWORD ?
.code
main PROC
call Clrscr

mov edx,offset myMessage1
call writestring
call ReadInt;takes input and moves it to EAX
mov inputN,eax;move the input number from the EAX register to inputN

mov ecx,inputN

L1:
mov count,ecx
mov ecx,inputN
L2:
mov edx,offset star
call writestring
loop L2;
mov edx,offset endl
call writestring
mov ecx,count

loop L1

exit

INVOKE EXITProcess ,eax

main ENDP

END main 









square PROC
push ebp
mov  ebp, esp
mov   eax, [ebp + 8]

mov inputN,eax;move the input number from the EAX register to inputN

mov ecx,inputN

L1:
mov count,ecx
mov ecx,inputN
L2:
mov edx,offset star
call writestring
loop L2;
mov edx,offset nl
call writestring
mov ecx,count

loop L1


square endp

















