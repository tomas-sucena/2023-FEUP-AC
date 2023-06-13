.text
.global nbits1

nbits1:
mv t0, zero # counter

.L1:
beqz a0, .end
andi t1, a0, 1
add t0, t0, t1
srli a0, a0, 1
beqz zero, .L1

.end:
mv a0, t0
ret
