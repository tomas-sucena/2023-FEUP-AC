.text
.global count_range

count_range:
mv t0, zero # counter

.L1:
beqz a1, .end
addi a1, a1, -1
flw ft0, 0(a0)
addi a0, a0, 4
fge.s t1, ft0, fa0
beqz t1, .L1
fle.s t1, ft0, fa1
beqz t1, .L1
addi t0, t0, 1
beqz zero, .L1

.end:
mv a0, t0
ret
