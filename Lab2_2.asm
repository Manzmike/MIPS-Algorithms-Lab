########################################################### 
# This code ask for a value to do factorial
# computatins on.
# After getting the value the code used the jal( Jump and link
# fucntion to go through the code.
# then outputts ypur value.
########################################################### 
.globl main 


.text
	main: 
	 
	
	#system call to print MSG1 
	li $v0,4   
	la $a0, SIZE 
	syscall 

	#Input for value
	li $v0,5
	syscall
	move $t1,$v0
	
	move $t2,$t1
	addi $v1,$v1,1
	addi $t3,$zero,1
	jal ZeroChecker
	jal Factorial
	
	li $v0,4
	la $a0,OUTPUT
	syscall
	
	#
	li  $v0, 1          
    	add $a0, $v1, $zero 
    	syscall
    	
    	
	#terminate program
	li      $v0, 10              
    	syscall  
	
	
	ZeroChecker:
	blt $t1,0,Exit_and_Quit_Negative
	beq $t1,0,Exit_and_Quit_Zero
	
	Factorial:
	beq $t1,$t3,Exit
	mul $v1,$v1,$t1
	addi $t1,$t1,-1
	li $v0,1
	j Factorial
	
	#Jummping to return addres of zero
	Exit:
	jr $ra
	
	#Exiting Code and Printing Error Message
	Exit_and_Quit_Negative:
	li $v0,4
	la $a0,ERROR
	syscall
	li $v0,10
	syscall
	
	#Exiting Code and Printing Error Message
	Exit_and_Quit_Zero:
	li $v0,4
	la $a0,ZERO
	syscall
	li $v0,10
	syscall
	
	
	
	

.data		
SIZE: .asciiz "Input a number for the factorial: "
ERROR: .asciiz "Error Negative Value"
ZERO: .asciiz "Error Value is Zero"
OUTPUT: .asciiz "Your output is: "