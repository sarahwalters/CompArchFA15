# Sum the numbers from 0 to N

addi $t0, $zero, 10 # N
addi $t1, $zero, 0 # sum

BEGIN:
beqz $t0, ENDIF
	add $t1, $t1, $t0
	addi $t0, $t0, -1
	j BEGIN
ENDIF:
addi $v0, $t1, 0
