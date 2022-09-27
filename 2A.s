; Troca de A para B

.data
    A: .word 10
    B: .word 7
    C: .word 0

.code
    ld r4,A(r0)
    ld r5,B(r0)

    sd r5,A(r0)
    sd r4,B(r0)

    halt