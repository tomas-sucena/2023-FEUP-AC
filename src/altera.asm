.text
.global altera

altera:
addi a0, a0, -2
blez a0, .end
li t4, 3
lbu t0, 0(a1) # prev
addi a1, a1, 1

.L1:
blez a0, .end
addi a0, a0, -1
lbu t1, 0(a1) # current
lbu t2, 1(a1) # next
add t3, t0, t1
add t3, t3, t2
div t3, t3, t4
sb t3, 0(a1)
addi a1, a1, 1
mv t0, t1
beqz zero, .L1

.end:
ret
