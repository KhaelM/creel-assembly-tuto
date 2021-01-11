.data
myBte db 7
antherBte db 100
mySignedQWord sqword ?

.code
SomeFunction proc
	mov ax, 65535
	mov ah, 0

	lea rax, myBte ; store the address of mybte into rax
	mov byte ptr [rax], 15 ; consider what is stored in rax as an address and write 15 to it
	mov myBte, 99
	mov myBte, al
	
	xor rax, rax
	add rax, -2147483649
; "add/sub reg64, imm64" read imm64 as 32 bit (it will truncate) and will sign extends the register (fill the first 8 bytes with FF) if the 31st bit is 1
	mov mySignedQWord, rax

	xor rax, rax
	mov rcx, -2147483649
	add rax, rcx
	mov mySignedQWord, rax

	xor rax, rax
	mov al, 255
; "note: inc/dec does not modify the CARRY(CY) flag if an overflow occurs, if we want to check that then use sub/add reg, 1"
	inc al
	ret
SomeFunction endp

RegTest proc
	mov rax, -1

	mov al, 5
	mov ax, 17

	mov eax, 1
	ret
RegTest endp

WhichRegForParam proc
	xor rax, rax
	ret
WhichRegForParam endp

AsmGCD proc
	mov rax, 0 ; error value
	cmp rcx, 0
	je Finished
	cmp rdx, 0 ; dividing by 0 not allowed
	je Finished

	push rbx
	mov rax, rcx
LoopHead:
	mov rbx, rdx
	div rdx; rdx = rax % rdx
	mov rax, rbx
	cmp rdx, 0
	jne LoopHead
	pop rbx

Finished:
	ret
AsmGCD endp

end