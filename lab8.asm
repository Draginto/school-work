	.text
	.globl main
main:
	la $a1, matrix		# use array as matrix.
	jal inputToArray
	#la $a1, matrix
	#jal printMatrixColwise

endProgram:
	li $v0, 10
	syscall			# End the program.

inputToArray:
	li $t0, 0		# i = 0
	li $t5, 0		# j = 0 
	li $t1, 3		# Load the rows
	li $t2, 4		# Load the cols.
	
	addAtIndex:
		la $a0, enterNum
		li $v0, 4
		syscall				# Print the message.
	
		li $v0, 5
		syscall				# get the user value.
	
		move $t3, $v0			# Move the users' value into $t3
		# rowwise indexing
		mul $t0, $t0, $t2		# first-index = col * i 
		add $t6, $t0, $t5		# second-index = first-index + j
	
		sw $t3, matrix($t6)		# Store the value given by user into this index position.
		
		beq $t5, $t2, getNewRow		# Branch if we've finished adding values in this row.
		addi $t5, $t5, 1		# move the index + 1
		j addAtIndex			# If we are finished inserting the values into index, get a new row.
		
	getNewRow:
		beq $t0, $t1, return		# Branch if there are no rows left.
		addi $t0, $t0, 1		# Add up the row index.
		li $t5, 0			# Reset $t5's counter to count up the loop again.
		j addAtIndex
	return:
	jr $ra 
.data
.align 2
matrix: .space 48
enterNum: .asciiz "Please enter a number"
