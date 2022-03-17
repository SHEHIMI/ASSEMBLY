.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
inputN DWORD ?;

msg1 byte "input n:",0dh,0ah,0;
count DWORD ?
prod DWORD ?
.code
main PROC

mov eax,0
mov edx,offset msg1
call writeString
call readint
mov inputN,eax;
mov count,eax

mov edx,0



L1:
mov eax,0;
dec count;
mov eax,count ;
cmp count,1;
je l2;

mul inputN;
mov inputN,eax;
mov prod ,eax;

jmp L1;
l2:
mov eax,prod
call writeint

exit
INVOKE EXITProcess ,eax
main ENDP

END main
