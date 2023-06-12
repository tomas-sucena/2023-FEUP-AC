.data
input: .asciz "n: "
result: .asciz "result: "

.text
.global sumSquare

li a7, 4
la a0, input
ecall

li a7, 5
ecall

sumSquare:
mv t0, zero

.L1:
ble a0, zero, .final
mul t1, a0, a0
add t0, t0, t1
addi a0, a0, -1
b .L1

.final:
li a7, 4
la a0, result
ecall

li a7, 1
mv a0, t0
ecall