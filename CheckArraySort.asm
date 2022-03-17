.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
msg1 byte "not sorted.",0dh,0ah,0
msg2 byte "sorted",0dh,0ah,0
array dword 1,2,3,4,5,2

.code
main PROC

mov esi,offset array

mov ecx,lengthOf array
dec ecx

l1:
mov eax,[esi];
mov ebx,[esi+4];
cmp eax,ebx

jg notSorted;

add esi,4 ;

loop l1;

sorted:

mov edx,offset msg2 
call writeString
jmp fin1;


notSorted:
mov edx,offset msg1
call writeString


fin1:
call dumpregs
exit
INVOKE EXITProcess ,eax
main ENDP
END main
