.thumb

@called from 183A0

push	{r14}

@original code
ldr		r1,ChapterData
ldrb	r1,[r1,#0xF]
cmp		r0,r1
bne		EndL @skip setting unit status

@here check if unit is alive
mov		r0,#0x0
ldrb	r1,[r5,#0x13] @r1 is never used again before the return of the original function
cmp		r0,r1
beq		CaseDead

@unit is alive, grey out the dropped unit
mov		r0,#0x2
orr		r3,r0
str		r3,[r2,#0xC]
b		EndCase

@unit is dead, un-grey the dropped unit
CaseDead:
mov		r0,#0xFD
and		r3,r0
strb	r3,[r2,#0xC]

EndCase:

EndL:

pop		{r0}
bx		r0

.align 4 
ChapterData: .long 0x202BCF0
