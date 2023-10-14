.data
string: .asciiz "Professor Kyoungwoo Lee is Awesome"
string_end:

.text
.main:
	# $a1 points to beginning of string
	la $a1, string
	
	# $a2 points to beginning of string_end (end of string)
	la $a2, string_end

	# recursion
	jal recursion

recursion:
	# loading first character to $t0
	lb $t0, ($a1)
	add $a0, $a0, $t0
	
	# when $t0 is zero, return
	beqz $t0, return
	
	# incrementing pointer to point to next character
	addi $a1, $a1, 1
	addi $a2, $a2, 1
	jal recursion
	
return:
	
	# print sum (stored in $a0)
	li $v0, 1	
	syscall
	
	# exit program
	li $v0, 10		
	syscall
