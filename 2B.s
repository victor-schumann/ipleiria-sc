; Troca de A para B

.data
    A: .word 10
    B: .word 7
    C: .word 0

.code
    ld r4,A(r0)
    ld r5,B(r0)

    dadd r6,r4,r0
    dadd r4,r5,r0
    dadd r5,r6,r0

    sd r4,A(r0)
    sd r5,B(r0)

    halt