.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data

prompt BYTE "Enter char: ", 0dh, 0ah, 0
char byte ?
nl byte " ",0dh,0ah,0
.code
main PROC



mov edx,offset prompt
call writeString
call ReadChar ;take char input
mov char,al;
mov edx,offset char
call writeString


mov edx,offset nl
call writeString

call ConvertToUpper;call method to convert to upper

jmp fin
ConvertToUpper PROC



mov char,al;

and char,11011111b
mov edx,offset char
call writeString

ret;
ConvertToUpper ENDP;


fin:
exit
INVOKE EXITProcess ,eax
main ENDP
END main
