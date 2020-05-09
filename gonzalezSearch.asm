	.text
	.globl main
main:
	jal getCount
	la $a1, intArray		# Store the address of array in argument
	move $a2, $v0 			# Take the return value $v0 and move to argument.
	jal getNumbers			# get the numbers to use in the count.
	
	jal newLine			# Output a newLine
	
	la $a1, intArray
	jal displayNumbers		# Show the contents of the array
	
	la $a1, intArray
	jal searchArray 		# Search for a specified value in the array.
	
	jal newLine 
exitProgram:
	la $a0, progComplete
	li $v0, 4
	syscall				# Print message in : progComplete
	
	li $v0, 10
	syscall	 			# Conventional closure of program.

getCount:
	la $a0, howMany
	li $v0, 4
	syscall					# Print: value in howMany label.
	
	li $v0, 5
	syscall					# Recieve the input from the user.
	
	jr $ra					# Jump back to where function was called. 

getNumbers:
	li $t0, 0				# i = 0
	pushToArray:
		bge $t0, $a2, endPush
		
		la $a0, inputToArray
		li $v0, 4
		syscall 			# Print message in : inputToArray
		
		li $v0, 5
		syscall 			# Get the user's choice of numbers.
		
		sw $v0, 0($a1)			# Store the word in the array.
		addi $a1, $a1, 4		# i++ increment the loop.
		addi $t0, $t0, 1		# i += 1
		
		j pushToArray			# Run through loop.
	endPush:
	jr $ra

newLine:
	la $a0, newline
	li $v0, 4
	syscall 				# Outputs a newline. 

	jr $ra


displayNumbers:
	add $t1, $t1, $a2 			# i = count;
	
	la $a0, arrContains
	li $v0, 4
	syscall 				# Print message in arrContains
	outputLoop:
		beq $t1, $zero, endOut
		lw $v0, 0($a1)			# Load the word in the register.
		
		move $a0, $v0
		li $v0, 1
		syscall				# Outputs the value in element of array.
		
		la $a0, newline
		li $v0, 4
		syscall				# Create space between integers.
		
		addi $a1, $a1, 4		# i++ increment the loop.
		addi $t1, $t1, -1		# i -= 1
		
		j outputLoop
	endOut:
		jr $ra				# Jump back to caller.

searchArray:
	
	# We setup our variables.
	la $t6, ($a1)				# Restore the address into register.
	li $t5, 0				# k = 0;
	li $t1, 0				# reset i before setting it to count.
	add $t1, $t1, $a2 			# i = count;
	li $t4, -9999				# Sentinel to end search.
	
	la $a0, searchfor
	li $v0, 4
	syscall 				# Print message in : searchFor
	
	li $v0, 5
	syscall					# Get the user's search value
	
	move $t2, $v0				# Move the user's inputted value into $t2 for later use.
	sequentialSearch:
	
		beq $t2, $t4, cancelSearch	# Branch if user value == -9999
		
		beq $t1, $t5, elemNotFound	
		lw $t3, 0($t6)			# Load the word in the register.
		
		beq $t3, $t2, elemFound		# Branch if the user's value is found in the array.
		
		addi $t6, $t6, 4		# i++ increment the array.
		addi $t5, $t5, 1		# k += 1
		
		j sequentialSearch
	
elemNotFound:
	move $a0, $t2
	li $v0, 1
	syscall					# Print the searched for integer value.

	la $a0, notFound
	li $v0, 4
	syscall					# Print message in : notFound.
	
	j searchArray				# Jump back to get another value.

elemFound:
	move $a0, $t2
	li $v0, 1
	syscall					# Print the searched for integer value.
	
	la $a0, found
	li $v0, 4
	syscall					# Print message in : Found.
	
	la $a0, indexLocale
	li $v0, 4
	syscall					# Print message in : indexLocale.
	
	addi $t5, $t5, 1			# k + 1 for location index.
	move $a0, $t5
	li $v0, 1
	syscall					# Print the location of value.
	
	j searchArray				# Jump back to get another value.

cancelSearch:
	
	jr $ra					# If user exits, jump back to end of program.

.data
intArray: .space 144
inputToArray: .asciiz "Enter a number: "
newline: .asciiz "\n"
howMany: .asciiz "How many numbers do you have? "
arrContains: .asciiz "The array contains the following: \n"
searchfor: .asciiz "\nEnter number to search for(-9999 to exit): "
notFound: .asciiz " was not found"
found: .asciiz " was found"
indexLocale: .asciiz " at location "
progComplete: .asciiz "\nProgram Complete" 
