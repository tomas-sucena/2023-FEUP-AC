.text
.global maskadd

maskadd:
fmv.s.x fa0, zero # result

.L1:
beqz a0, .end
flw ft0, 0(a1)
andi t2, a0, 1
srli a0, a0, 1
addi a1, a1, 4
beqz t2, .L1 # check if b(i) == 0
beqz a2, .L2 # check the flag

addi sp, sp, -32
sw ra, 28(sp)
sw a0, 24(sp)
sw a1, 20(sp)
sw a2, 16(sp)
fsw fa0, 12(sp)
fmv.s fa0, ft0
jal ra, subrotina
fmv.s ft0, fa0
flw fa0, 12(sp)
lw a2, 16(sp)
lw a1, 20(sp)
lw a0, 24(sp)
lw ra, 28(sp)
addi sp, sp, 32

.L2:
fadd.s fa0, fa0, ft0
beqz zero, .L1

.end:
ret
