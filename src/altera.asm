.text
.global altera

altera:
addi a0, a0, -2
lbu t0, 0(a1) # prev
addi a1, a1, 1
li t3, 3

.L1:
beqz a0, .end
lbu t1, 0(a1) # curr
lbu t2, 1(a1) # next
addi t4, t0, t1
addi t4, t4, t2
div t4, t4, t3
sb t4, 0(al)
mv t0, t1
addi a0, a0, -1
addi a1, a1, 1
beqz zero, .L1

.end:
ret
