########################################################### 
# This program will ask for one int
# adds and subtracts them. 
# It demonstrates how to use arithmetic operations, and 
# how to load and store values. 
########################################################### 

.globl main

main:
	#Print Get_string
	li $v0,4
	la $a0,Get_len
	syscall
	
	#Print Get_string
	li $v0,5
	syscall
	move $t1,$v0
	
	#Print Get_string
	li $v0,4
	la $a0,Get_String
	syscall
		
	#getting input for userInput for string value
	la $a0, userInput
	li $a1,20
	li $v0,8
	syscall
		
	#loading address of userinput into 2 diffrent arrays 	
	la $t8,userInput
	la $t9,userInput

	
count_vals:
	#load bu t9 into t2
	lb $t2,($t9)
	#lb $t2,0($t9
	#if t2 equal to zero which is null then jump to end
	beq $t2,$zero, fix_list
	addi $t9,$t9,1
	addi $v1,$v1,1
	j count_vals
	
fix_list:
#move the displacement of t9 and go back two places
	addi $t9,$t9,-2
	addi $v1,$v1,-1
	#lb $t3,2($t9)
	j input_Check
	
input_Check:
	beq $v1,$t1,palindrome_Checker
	
	bne $v1,$t1,error_state

palindrome_Checker:
	#palidrome is equal to t8 to t9
	ble $t9,$t8,returnTrue
	lb $t2,($t8)
	#load the from t8 and store into t2
	lb $t3,($t9)
	#load the from t8 and store into t2
	
	#palidrome is equal to t8 to t9
	bne $t2,$t3,returnFalse
	addi $t8,$t8,1
	#add one to t8
	addi $t9,$t9,-1
	#add negative one to t9
	
	#repeat palindrome_Checker
	j palindrome_Checker
	
	
	
#return true for v1 equaling zero for print out	
returnTrue:
	addi	$v1, $zero, 1
	j print
	
#return false for v1 equaling zero for print out		
returnFalse:
	addi	$v1, $zero, 0
	j print
	
#Branch equal statements for palindrome
print:
	beq $v1,1,printpal

	beq $v1,0,printnotpal
	
#If palindrome is true 
printpal:
	li $v0,4
	la $a0,True
	syscall
	li $v0,10
	syscall
	
#If palindrome is false
printnotpal:
	li $v0,4
	la $a0,False
	syscall
	li $v0,10
	syscall
	
error_state:
	li $v0,4
	la $a0,Error
	syscall
	li $v0,10
	syscall
.data
	Get_len: .asciiz "Enter a your string length: "
	Get_String: .asciiz "Enter a character string: "
	True: .asciiz "Word is a palindrome"
	False: .asciiz "Word is not a palindrome"
	Error: .asciiz "Word length and inputted do not match"
	userInput: .space 20