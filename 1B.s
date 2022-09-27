; my first program
; C = A + B + Z

.data
    A: .word 10
    B: .word 7
    C: .word 0
    Z: .word 3

.code
    ld r4,A(r0)
    ld r5,B(r0)
    ld r7,Z(r0)

    dadd r6,r4,r5
    dadd r6,r6,r7
    sd r6,C(r0)

    halt