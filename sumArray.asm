.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
array dword 1,2,3,5
endl byte " ",0dh,0ah,0

.code
main PROC

mov esi,0
mov eax,0

mov esi,offset array

mov ecx,lengthOF array 



L1:


add eax,[esi]

ADD ESI,type array
loop l1;


call writeInt;

exit
INVOKE EXITProcess ,eax
main ENDP
END main