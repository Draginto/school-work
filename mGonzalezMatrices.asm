	.text
	.globl main
main:
	la $a0, enterRows				# Load prompt into function as argument.
	jal getValue					# Get Size of rows.
	
	move $a1, $v0					# Store the rowsize to argument1.
	la $a0, enterCols				# Load prompt into function as argument. 
	jal getValue					# Get Size of cols.
		
	move $a2, $v0					# Store the colsize to argument2.
	la $a0, matrixA					# Load the address of the first matrix for use.
	li $a3, 1					# Set flag = 1, which will enable colWiseStorage in function.
	jal formMatrix					# Forms the first matrix using colwisestorage.
	
	la $a0, matrixB					# Load the address of the second matrix for use.
	li $a3, 0					# Set flag = 0, which will enable rowWiseStorage in function.
	jal formMatrix					# Form the second matrix.
	
	move $a0, $a1					# Move the rowsize to temp variable to avoid losing value.
	move $a1, $a2					# Move the colsize to temp var to avoid losing value
	
	la $a2, matrixA				# Load the address of matrixA into argument for summation.
	la $a3, matrixB				# Load the address of matrixB into argument for summation.
	#jal addMatrices		
	
	#la $a0, results				# Load "RESULTS" message into function.
	#jal printMessage				# Print the message given in argument.
		
	#la $a1, matrixA				# Load first matrix into argument.
	#jal printMatrix				# Print the first matrix.
		
	#la $a0, plus					# Load "PLUS" message into function.
	#jal printMessage				# Print the message given in argument.
	
	#la $a1, matrixB				# Load first matrix into argument.
	#jal printMatrix				# Print the first matrix.
	
	#la $a0, equal					# Load "EQUALS" message into function.
	#jal printMessage				# Print the message given in argument.

	endProgram:
		li $v0, 10
		syscall					# Exit the program.
getValue:
	addi $sp, $sp, -4				# Make room in stack.
	sw $ra, 0($sp)					# Store the return address to stack.
	li $v0, 4
	syscall						# Print the message given in argument.
	
	li $v0, 5
	syscall						# Get the user's input.
	
	lw $ra, 0($sp)					# Move back register to address.
	addi $sp, $sp, 4				# Restore stack.
	jr $ra						# Jump back to call.
	

formMatrix:
	addi $sp, $sp, -4				# Make room in stack for return address.
	sw $ra, 0($sp)					# Store the return address in the stack.
	move $t2, $a1					# Move rowsize to temp variable.
	move $t3, $a2					# Move colsize to temp variable.
	move $t5, $a0					# Move the address of matrix to temp variable.
	li $t0, 0					# rowIndex = 0

	addToIndexRowsOuter:
		bge $t0, $t2, return			# Branch if we've finished adding values in this row.
		li $t1, 0				# colIndex = 0
		
	addToIndexColumnsInner:
		bge $t1, $t3, rowEnd 			# Get a new row when colIndex > colSize.
		
		bne $a3, 1, switchToRowWise		# If flag = 0, use rowWiseStorage.
		mul $t4, $t1, $t2			# $t4 = colIndex * rowSize.
		add $t4, $t4, $t0			# + rowIndex.
		mul $t4, $t4, 4				# * Data_size.
		add $t4, $t4, $t5 			# + Base address.
		
		la $a0, enterNum			# Load the message for use in function.
		jal getValue				# Store values columnwise.
		
		b innerAdd				# Branches to innerAdd to store value.
		
		switchToRowWise:
		mul $t4, $t0, $t3			# $t4 = rowIndex * colSize.
		add $t4, $t4, $t1			# + colIndex.
		mul $t4, $t4, 4				# * Data_size.
		add $t4, $t4, $t5 			# + Base address.
		
		la $a0, enterNum			# Load the message for use in function.
		jal getValue				# Store values rowWise.
		
		b innerAdd				# Branches to innerAdd to store value.
		
		innerAdd:
		sw $v0, 0($t4)				# Store the value given by user into this index position.
		addi $t1, $t1, 1			# Move the colIndex + 1
		
		j addToIndexColumnsInner		# If we are finished inserting the values into index, get a new row.
		
	rowEnd:
		addi $t0, $t0, 1			# Get the next row; rowIndex + 1.
		j addToIndexRowsOuter			# Jump back to beginning
	return:
	lw $ra, 0($sp)	
	addi $sp, $sp, 4
	jr $ra

addMatrices:
	addi $sp, $sp, -4				# Make room in stack for return address.
	sw $ra, 0($sp)					# Store the return address in the stack.
	move $t2, $a0					# Move rowsize to temp variable.
	move $t3, $a1					# Move colsize to temp variable.
	move $t5, $a2					# Move the address of matrix A to temp variable.
	move $t6, $a3					# Move the address of the matrix B to temp variable.
	li $t0, 0					# rowIndex = 0
	
	addToIndexRowsOuter:
		bge $t0, $t2, return			# Branch if we've finished adding values in this row.
		li $t1, 0				# colIndex = 0
		
	addToIndexColumnsInner:
		bge $t1, $t3, rowEnd 			# Get a new row when colIndex > colSize.
		
		mul $t4, $t0, $t3			# $t4 = rowIndex * colSize.
		add $t4, $t4, $t1			# + colIndex.
		mul $t4, $t4, 4				# * Data_size.
		add $t4, $t4, $t5 			# + Base address.
		
		lw $s0, 0($t4)				# Load the value at this address.
		
		li $t4, 0				# Clear $t4
		mul $t4, $t0, $t3			# $t4 = rowIndex * colSize.
		add $t4, $t4, $t1			# + colIndex.
		mul $t4, $t4, 4				# * Data_size.
		add $t4, $t4, $t6 			# + Base address.
		
		lw $s1, 0($t4)
		
		add $t7, $s1, $s0			# add the values in the indexes. 
		sw $t7, 0("the index of matrixC belongs here") 
		
		j addToIndexColumnsInner		# If we are finished inserting the values into index, get a new row.
		
	rowEnd:
		addi $t0, $t0, 1			# Get the next row; rowIndex + 1.
		j addToIndexRowsOuter			# Jump back to beginning
	return:
	lw $ra, 0($sp)	
	addi $sp, $sp, 4
	jr $ra

.data 
.align 2
matrixA: .space 324
.align 2
matrixB: .space 324
.align 2
matrixC: .space 324
enterRows: .asciiz "How many rows in your matrices (max 9)? "
enterCols: .asciiz "How many columns in your matrices (max 9)? "
m1: .asciiz "For matrix number 1\n"
m2: .asciiz "For matrix number 2\n"
results: .asciiz "RESULTS\n"
plus: .asciiz "PLUS\n"
equal: .asciiz "EQUALS\n"
enterNum: .asciiz "Please enter a number: "
