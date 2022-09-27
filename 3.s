; C = A + B
; print C

.data
    CR: .word 0x10000
    DR: .word 0x10008

    A: .word 10
    B: .word 7
    C: .word 0
    D: .word 1

.code
    ld r1,CR(r0)
    ld r2,DR(r0)
    ld r4,A(r0)
    ld r5,B(r0)

    dadd r6,r4,r5
    sd r6,C(r0)
    sd r6,(r2)
    daddi r3,r0,1

    sd r3,(r1)

    halt
