.text
.global afunc

.data
n1: .float 5
n2: .float -3.5
n3: .float 1

afunc:
la t0, n1
flw ft5, 0(t0) # 5
la t0, n2
flw ft3, 0(t0) # -3.5
la t0, n3
flw ft1, 0(t0) # 1

.L1:
blez a1, .end

flw ft0, 0(a0)
fabs.s ft2, ft0
fgt.s t0, ft2, ft5
beqz t0, .call

fmul.s ft4, ft0, ft3 # -3.5x
fmul.s ft6, ft0, ft0 # x^2
fadd.s ft6, ft6, ft1 # x^2 + 1
fdiv.s fa0, ft4, ft6
beqz zero, .store

.call:
addi sp, sp, -32
sw ra, 28(sp)
fsw ft5, 24(sp)
fsw ft3, 20(sp)
fsw ft1, 16(sp)
sw a0, 12(sp)
sw a1, 8(sp)
sw a2, 4(sp)
fsw ft0, 0(sp)

fmv.s fa0, ft0
call pfunc

flw ft0, 0(sp)
lw a2, 4(sp)
lw a1, 8(sp)
lw a0, 12(sp)
flw ft1, 16(sp)
flw ft3, 20(sp)
flw ft5, 24(sp)
lw ra, 28(sp)
addi sp, sp, 32

fadd.s fa0, fa0, ft0

.store:
fsw fa0, 0(a2)
addi a0, a0, 4
addi a2, a2, 4
addi a1, a1, -1
beqz zero, .L1

.end:
ret
