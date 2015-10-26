addi $t0, $zero, 0 # index into array
addi $t1, $zero, 16 # length of array times 4

loop:
beq $t0, $t1, done
lw $t2, array($t0)
add $t3, $t2, $t2 # double
sw $t3, array($t0)
addi $t0, $t0, 4
j loop
done:

.data
array:
0x1
0x42
0x31
0x14