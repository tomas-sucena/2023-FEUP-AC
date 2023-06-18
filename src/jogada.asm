.text
.global jogada

jogada:
blez a1, .end
slli t0, a2, 2
add t0, a0, t0
flw ft0, 0(t0)
fmul.s fa0, fa0, ft0

addi sp, sp, -32
sw ra, 28(sp)
sw a0, 24(sp)
sw a1, 20(sp)
sw a2, 16(sp)
fsw fa0, 12(sp)

call roll

flw fa0, 12(sp)
lw a2, 16(sp)

# calculate the next position
add a2, a2, a0
li a0, 12
rem a2, a2, a0

lw a1, 20(sp)
lw a0, 24(sp)
lw ra, 28(sp)
addi sp, sp, 32

addi a1, a1, -1
beqz zero, jogada

.end:
ret
