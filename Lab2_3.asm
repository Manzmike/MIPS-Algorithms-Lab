########################################################### 
#this program will promopt for you to 
#enter the amount of 
#values you'd like to enter.
#From here you will enter the values
# the code has self itteration to stop when the max
#amount is reached.
# The code uses itterations of the stored aaddress to
#make it through the code.
# It compares , then outputs the values depended 
# on what the inputs were
#[1]"Bubble sort in MIPS assembly.", Gist, 2022. [Online]. Available: https://gist.github.com/manudatta/4283660. [Accessed: 21- Sep- 2022]
# A reference was used to help through to cod 
########################################################### 

.text 				
		
.globl main
main:
	#get the starting point of array
	move $s0,$gp			
	addi $t0,$t0,1			
     
	addi $t7,$zero,0
		
	#to print out the value		       
	li $v0,4		
	la $a0,Get_Amount		
	syscall		
	
	#to get the value
	li $v0,5			
	syscall
	move $t8,$v0
	
	# to print out the get value(s)
	li $v0,4		
	la $a0,Get_Len		
	syscall	
	
	move $s1,$s0
	
GetVals:
	#compare value for the t9 and t8
	beq $t9,$t8,Sort # end of s
	
	#calling to get value
	li $v0,5
	syscall	
	
	#storing the values through the vit and incrint of s1
	sb $v0,0($s1)	
	#increase the value s1 by 1
	addi $s1,$s1,1
	
	#storing our s1 value into t5
	move $t5,$s1
	#incrmtation counter of t9
	addi $t9,$t9,1
	
	#loop of enter values until loop is broken
	j GetVals
	
	
Sort:
	#moving value of s0 to t4
	move $t4,$s0
	
	sub $s1,$s1,$t0
	
	#jump to before_ending if s1 and s0 are equal
	beq $s1,$s0,before_ending  	
	#moving value of s2 to s0
	move $s2,$s0
	
sort1:
	#Get the first value
	lb $t1,0($s2)
	#Get the Second Value
	lb $t2,1($s2)
	
	# if t2 less than 1 then t3 equal to 1
	slt $t3,$t2,$t1	
	#if t3 equal to zero then jump to 
	beqz $t3,sort2
	
	#store bites of s2 into t2 for the baility to grab them again if needed
	sb $t2,0($s2)	
	#store bites of s1 into t1 for the baility to grab them again if needed	
	sb $t1,1($s2)			
		
sort2:
	#adding one to s1 for itteration
	addi $s2,$s2,1	
	#if s2 dne to s1 then jump to this junction again	
	bne $s2,$s1,sort1 
	
sort3:
	#adding one to t4 for itteration
	addi $t4,$t4,1
	#if t4 dne to r5 then jump to this junction again
	bne $t4,$t5,sort3
jal Sort

before_ending:
	#print the "Sorted values"
	li $v0,4
	la $a0,Sorted
	syscall
	j ending

#prining the list has been sorted
ending:
	#if branch eq v1 to t9 then jump to end other wise
	beq $v1,$t9,end
	#print array value or but by bit
	li $v0,1
	lb $a0,0($t4)
	syscall
	
	#print comma
	li $v0,4
	la $a0,Commma
	syscall
	#value for comparison
	addi $v1,$v1,1
	addi $t4,$t4,1
j ending

end:
	li $v0,10
	syscall

.data

Sorted: .asciiz "Sorted values:\n"
Commma: .asciiz "\,"
Sorting: .asciiz "\nSorted\n"
Get_Len: .asciiz "Enter integer values:\n"
Get_Amount: .asciiz "Enter the number of values you'd like to impliment:"