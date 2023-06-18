.text
.global comuns

comuns:
li t2, 8

.L1:
beqz t2, .no
lb t0, 0(a0)
lb t1, 0(a1)
and t3, t0, t1
bnez t3, .yes
addi a0, a0, 1
addi a1, a1, 1
addi t2, t2, -1
beqz zero, .L1

.yes:
li a0, 1
ret

.no:
li a0, 0
ret
