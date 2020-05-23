	.text
	.globl main
main:
	la $a1, matrix				# use array as matrix.
	jal inputRowWise
	la $a1, matrix
	jal printMatrixColwise

endProgram:
	li $v0, 10
	syscall					# End the program.

inputRowWise:
	li $t0, 0				# rowIndex = 0
	li $t1, 0				# colIndex = 0 
	li $t2, 3				# rowSize = 3
	li $t3, 4				# colSize = 4
	
	addAtIndex:
		bge $t1, $t3, getNewRow		# Branch if we've finished adding values in this row.
		# colomnwise storing
		mul $t4, $t0, $t3		# $t4 = rowIndex * colSize 
		add $t4, $t4, $t1		# + colIndex
		mul $t4, $t4, 4			# * Data_size.
		add $t4, $t4, $a1 		# + Base address.
		
		la $a0, enterNum
		li $v0, 4
		syscall				# Print the message.
	
		li $v0, 5
		syscall				# get the user value.
		
		sw $v0, 0($t4)			# Store the value given by user into this index position.
		
		addi $t1, $t1, 1		# move the index + 1
		j addAtIndex			# If we are finished inserting the values into index, get a new row.
		
	getNewRow:
		addi $t0, $t0, 1		# Add up the row index.
		bge $t0, $t2, return		# Branch if there are no rows left.
		li $t1, 0			# Reset $t5's counter to count up the loop again.
		j addAtIndex
	return:
	jr $ra

.data 
.align 2
matrix: .space 48
space: .asciiz ", "
enterNum: .asciiz "Please enter a number: "
.eqv DATA_SIZE 4
