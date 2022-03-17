.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data
array dword 0,0,0,0,0,0,0,0,0,0
fib dword 0,1,1,2,3,5,8
sum dword ?

.code
main PROC

push OFFSET arr; int arr
push lengthof arr; int size
call fibonacci;


mov ecx,lengthof array
mov eax,0
mov esi,offset array
l2:
mov eax,[esi]
call writeInt

add esi ,4
loop l2;


call isFibonacci;


call ConvertToUpper
fibonacci PROC
push ebp
mov  ebp, esp
pushad
mov  esi, [ebp + 12]


mov eax,0
mov [esi],eax;

add esi,4

mov ebx,1
mov [esi],ebx;



add esi,4

mov  ecx,[ebp + 8]
dec ecx
dec ecx
loop1:

mov ebx,[esi-8];

mov eax,[esi-4]

mov sum,eax;


mov eax,0
mov eax,sum
mov [esi],eax



mov sum,0;

add esi,4

loop loop1;


popad; 
	  pop ebp
	  ret 8; 
fibo ENDP

isFibonacci PROC
mov ecx, (LENGTHOF arr) - 2
 mov esi, OFFSET arr; 
 mov edi, OFFSET arr; 
 add edi, 8


l1:

mov eax, [esi]
add esi, 4;
add eax, [esi]
cmp eax, [edi]
jne notfibo

add edi, type fib
loop l1;

fibo:
mov edx, offset msg1
jmp writemsg


notfib0:
mov edx, offset msg2


writemsg:
call WriteString

ret;
isFibonacci ENDP

ConvertToUpper PROC



mov char,al;

and char,11011111
mov edx,offset char
call writeString


ConvertToUpper ENDP;










exit
INVOKE EXITProcess ,eax
main ENDP
END main
