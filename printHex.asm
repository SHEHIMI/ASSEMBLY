.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO ,dwExitCode:DWORD

Include Irvine32.inc

.data

msg byte "enter number to place in eax:",0dh,0ah,0


.code
main PROC

mov edx,0
mov edx,offset msg
call writeString
mov eax,0
call readInt;store value in eax

xor edx,edx;

call printHEX;call the proc printHex

jmp finish

printHEX PROC



l:

shld edx,eax,4;shift the first bit to edx

shl eax,4;remove bit from eax

cmp edx,9;check if digit or character
jg char1;
call writeString;




cmp eax,0;
je done;



char1:
cmp edx,10;check which character and print 
je printA

cmp edx,11
je printB

cmp edx,12
je printC

cmp edx,13
je printD

cmp edx,14
je printE

cmp edx,15
je printF1


printA:
mov al,'A'
call writeChar;
jmp l1;

printB:
mov al,'B';
call writeChar;
jmp l1;

printC:
mov al,'C';
call writeChar;
jmp l1;
printD:
mov al,'D';
call writeChar;
jmp l1;
printE:
mov al,'E';
call writeChar;
jmp l1;
printF1:
mov al,'F';
call writeChar;
jmp l1;


l1:
mov edx,0;empty edx
jmp l;

done:
ret 
printHEX ENDP

finish:

exit
INVOKE EXITProcess ,eax
main ENDP
END main
