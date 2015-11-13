li $a0, 7
jal fibonacci
move $s0, $v0
move $s1, $v1

li $v0, 10
syscall

fibonacci:
# base cases
beq $a0, 0, end0
beq $a0, 1, end1

# else, return f_{n-1} + f_{n-2}
# ...push $ra, $a0
addi $sp, $sp, -8
sw $ra, 4($sp)
sw $a0, 0($sp)

# ...run fibonacci for n-1 and n-2
addi $a0, $a0, -1
jal fibonacci

# ...pop $ra, $a0, 
lw $ra, 4($sp)
lw $a0, 0($sp)
addi $sp, $sp, 8

# ...return fib_{n-1} + fib_{n-2}
add $v0, $v0, $v1 # f_n = f_n-1 + f_n-2
sub $v1, $v0, $v1 # f_n-1 = f_n - f_n-2
jr $ra

end0:
li $v0, 0
li $v1, 0
jr $ra

end1:
li $v0, 1
li $v1, 0
jr $ra
