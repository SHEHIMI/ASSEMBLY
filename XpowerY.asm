.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data

inputX DWORD ?;
inputY DWORD ?;
msg1 byte "input x:",0dh,0ah,0;
msg2 byte "input y:",0dh,0ah,0;

.code
main PROC
mov edx,offset msg1
call writeString
call Readint
mov inputX,eax;
mov eax,0;
mov edx,offset msg2
call writeString
call Readint
dec eax;
mov inputY,eax;


mov ecx,inputY;
mov eax,0
mov eax,inputX;
L1:


mul inputX;


loop L1;




call dumpregs

exit
INVOKE EXITProcess ,eax
main ENDP

END main