@ Author  Ramanuj Goel, 2020CS50437
@ Modified from Division macro from https://developer.arm.com/documentation/dui0068/b/Writing-ARM-and-Thumb-Assembly-Language/Using-macros/Unsigned-integer-division-macro-example
	.global div
	.text
				@ some maths functions
div:
				@ r0 has divident
				@ r1 has divisor
				@ r0 will have quotient
				@ r1 will have remainder

	mov     r3, r1
        cmp     r3, r0, LSR #1
L1:	movls   r3, r3, LSL #1
        cmp     r3, r0, LSR #1
        bls     L1
        mov     r2, #0
L2:	cmp     r0, r3
        subcs   r0, r0, r3
        adc     r2, r2, r2
        mov     r3, r3, LSR #1
        cmp     r3, r1
        bhs     L2	
	mov r1, r0
	mov r0, r2
	mov pc, lr

