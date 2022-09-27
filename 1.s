; my first program
; C = A + B

.data
    A: .word 10
    B: .word 7
    C: .word 0

.code
    ld r4,A(r0)
    ld r5,B(r0)
    dadd r6,r4,r5
    sd r6,C(r0)

    halt