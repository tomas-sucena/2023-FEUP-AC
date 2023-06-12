.text
.global nperto

nperto:
mv t1, zero # counter

.L1:
blez a2, .end
lw t2, 0(a0)
lw t3, 0(a1)
sub t2, t2, t3
bgez t2, .pos
sub t2, zero, t2

.pos:
addi a0, a0, 4
addi a1, a1, 4
addi a2, a2, -1
bgt t2, a3, .L1
addi t1, t1, 1
beqz zero, .L1

.end:
mv a0, t1
ret
