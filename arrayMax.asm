.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
array dword 1,24,5,6,8
endl byte " ",0dh,0ah,0

.code
main PROC

mov esi,0
mov esi,offset array
mov ecx,lengthOF array 

mov eax,[esi]
L1:

cmp [esi],eax
jl setMin
jmp next 

setMin:
mov eax,[esi]
next:
add esi,type array 
loop l1;

call writeInt

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mov esi,0
mov eax,0
mov ecx,0

mov eax,array[esi];
mov ecx,lengthOF array 


mov edx,offset endl
call writestring

L2:


cmp array[esi],eax
jg setMax
jmp next1 

setMax:
mov eax,array[esi]
next1:
add esi,type array 
loop l2;


call writeInt

exit
INVOKE EXITProcess ,eax
main ENDP
END main
