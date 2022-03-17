Include Irvine32.inc

.data
array DWORD 2,3,5,99,6,7
nl byte " ",0dh,0ah,0
input dword ?
star dword "* "
count dword ?
space dword "  ";
.code
main PROC

call readInt;
call printsquare;


exit
main ENDP
 printsquare PROC
push ebp
mov ebp,esp
pushad;
mov input,eax;

mov edx,offset star ;

mov ecx,input
firstLine:
call writeString;			print the first line of stars 
loop firstLine;

mov edx,offset nl;			print new line
call writeString 

mov ecx,input
dec ecx
dec ecx

outer:
mov count,ecx;save the outer loop
mov ecx,input;set inner
inner:
cmp ecx,input
je printStar

cmp ecx,1;				print only at 1 and N
je printStar

mov edx,offset space
call writeString 
jmp finLoop;

printstar:
mov edx,offset star
call writeString 



finLoop:


loop inner;
mov ecx,count;restore the outer loop count
mov edx,offset nl
call writeString ;
loop outer;


mov edx,offset star
mov ecx,input
EndLine:
call writeString;			print the first line of stars 
loop EndLine;

mov edx,offset nl;			print new line
call writeString ;


pop ebp
popad;pop registers and clean up stack 
ret ;
printsquare ENDP;

END main