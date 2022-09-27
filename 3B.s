; Ask for A and B
; return A+B

.data
    CR: .word 0x10000
    DR: .word 0x10008

.code
    ld r1,CR(r0)
    ld r2,DR(r0)

    daddi r3,r0,8
    sd r3,(r1)
    ld r4,(r2)
    halt
