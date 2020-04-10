	.text
	.globl main
main:
	jal intLoop  # Jumps to function intLoop, to get the users input.
	
	la $a0, sumResult # Displays message: "The sum is: ."
	li $v0, 4
	syscall
	
	add $s0, $t0, $zero # Store the sum in $s0.
	
	move $a0, $t0 # Moving the sum in $t0 to $a0, to display the integer total. 
	li $v0, 1
	syscall 
	
	add $s1, $t1, $zero # Store the number count in $s1.
	move $a1, $t1 # We move our count variable to $a1 register to use in function.
	
	jal displayCount # Jumps to function displayCount, in order to display the count of numbers
	
	addi $s2, $s0, 0 # add sum to $s0 for later use.
	addi $s3, $s1, 0 # add n to $s0 for later use.
	
	move $a2, $s0 # move the sum to $a2 for use in averageTopHalf.
	move $a3, $s1 # move the count to $a3 for use in averageTopHalf.
	
	jal averageTopHalf # Displays the average of numbers entered.
	
	add $a0, $zero, $v1 # Retrieves the return value of averageTopHalf.
	li $v0, 1
	syscall # Displays the quotient.
	
	la $a0, decimalPoint 
	li $v0, 4
	syscall # Display the decimal point.
	
	# -- Start dividing up to 3 decimal points. -- 
	
	addi $t2, $zero, 10 # Get the multiplier(10).
	addi $t3, $t3, 3 # End at 3.
	addi $t7, $t7, 0 # start at 0.
	
	loopingDiv:
		div $s2, $s3 # sum/n = ...
		mfhi $t4 # The remainder in $t4.
		
		beq $t7, $t3, end
		
		mult $t4, $t2 # multiply the current remainder by 10.
    		mflo $s0
        
    		div $s0, $s3 # divide the new remainder 
    		mflo $t5 # Stores new quotient in $t5. 
    		mfhi $s2 # Stores new remainder ( Will replace the sum in top of loop ). 
		
		move $a0, $t5 #move quotient to $a0 register.
		li $v0, 1
		syscall # Prints 1st decimal.
		
		addi $t7, $t7, 1 # count+=1 
		j loopingDiv	
	
end:
	li $v0, 10
    	syscall  # Terminate program.
		
intLoop:
	la $a0, Prompt
	li $v0, 4
	syscall # Ask for number.
	
	li $v0, 5
	syscall # Get the users' number.
	
	# -- Compare if the number entered was not 0 -- 
	beq $v0, $zero, getOutofLoop
	
	add $t0, $t0, $v0 # We total the sum, from numbers entered.
	addi $t1, $t1, 1 # We add the total of numbers entered by user.
	
	j intLoop
	
getOutofLoop:	
	jr $ra # Jumps back to place where it was called.

displayCount:
	la $a0, newline  
	li $v0, 4
	syscall # Outputs a newline to clean up the display.
	
	move $a0, $a1 # We move to $a0 register from our $a1, because we need $a0 to display int.
	li $v0, 1
	syscall 
	
	la $a0, numbersEntered
	li $v0, 4
	syscall # Display message : " numbers were entered."
	
	jr $ra # Jump back to previous call.

averageTopHalf:
	la $a0, newline
	li $v0, 4
	syscall # Outputs a newline to clean up the display.
	
	la $a0, avgResult
	li $v0, 4
	syscall # Display message : "The average is: "
	
	div $a2, $a3 # sum/n = ...

	mflo $s1 # Moves the quotient to $s1.
	
	add $v1, $zero, $s1 # Return the quotient.
	
	jr $ra # Jump back to previous statement.
	
.data
Prompt: .asciiz "Enter a number(0 to exit): "
sumResult: .asciiz "The sum is: "
numbersEntered: .asciiz " numbers were entered"
avgResult: .asciiz "The average is: "
newline: .asciiz "\n" 
decimalPoint: .asciiz "."
