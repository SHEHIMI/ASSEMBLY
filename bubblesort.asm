.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
arr dword 9,3,5,1
count dword ?
temp dword ?
msg1 byte "in loop",0dh,0ah,0
msg2 byte "break",0dh,0ah,0
.code
main PROC

push OFFSET arr; int arr
push lengthof arr; int size
call bubblesort;call sorting method 

;;;print after sort;;;

mov esi,offset arr
mov ecx,lengthof arr

mov eax,0;
mov ecx,0;
mov ecx,lengthof arr
l1:
mov eax,[esi]
call writeInt;
add esi,4;

loop l1;


bubblesort PROC 

push ebp
mov  ebp, esp
pushad; save registers

mov ecx,[ebp+8]; array size

mov edx,0;

outer:

mov esi, [ebp+12];point to array

mov count,ecx;save outer loop

mov edx,count;
mov temp,edx; 
dec temp;
cmp temp,0
je fin;
mov ecx,temp;set inner loop to outer loop count-1 


inner:

mov ebx,[esi]
cmp ebx,[esi+4]
jg swap
jmp con;

swap:

mov eax,[esi];
mov ebx,[esi+4];
mov [esi],ebx;
mov [esi+4],eax;

con:
add esi,4;
loop inner;


mov ecx,count;
loop outer;
fin:
popad; restore registers
pop ebp;
ret 8; clean up the stack

bubblesort ENDP


exit
INVOKE EXITProcess ,eax
main ENDP
END main
