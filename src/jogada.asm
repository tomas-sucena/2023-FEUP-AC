.text
.global jogada

jogada:

.L1:
beqz a1, .end
addi a1, a1, -1

slli t0, a2, 2
add t1, a0, t0
flw ft0, 0(t1)
fmul.s fa0, fa0, ft0

# push to the stack
addi sp, sp, -32
sw ra, 28(sp)
sw a0, 24(sp)
sw a1, 20(sp)
sw a2 16(sp)
fsw fa0, 12(sp)

call roll
mv t0, a0

# pop from the stack
flw fa0, 12(sp)
lw a2, 16(sp)
lw a1, 20(sp)
lw a0, 24(sp)
lw ra, 28(sp)
addi sp, sp, 32

add a2, a2, t0
li t0, 12
rem a2, a2, t0
beqz zero, .L1

.end:
ret
