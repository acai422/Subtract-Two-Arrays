#Aaron

.data
difference: .asciiz "Array[C]: "			#store string to difference
arrayA: .word 10, 3, 7, 1, 12, 20, 16, 18, 11, 17	#Array1 to store the first list
arrayB: .word 3, 4, 2, 8, 4, 1, 7, 9, 10, 20		#Array2 to store the second list
arrayC: .space 10					#ArraySum to store the sum of 								 Array1 and Array2

.text
main:   
	la $t1, arrayA  	#$t1 = address of arrayA
	la $t2, arrayB		#$t2 = address of arrayB
	la $t3,	arrayC		#$t3 = address of arrayC
     	
	li $t4, 0		#setting $t4 = 0; t4 will serve as a counter
	li $s1, 10		#setting $s1 = 10
	
	li $v0, 4		#printing out strings
	la $a0, difference	#print out the actual string
	syscall 		#system call

	j loop			#jump to loop

loop:
	beq $t4, $s1, final	#if $t1 == $s1, then go to final
	
	lw $t5, 0($t1)		#get value from array cell and store in $t5
	lw $t6, 0($t2)		#get value from array cell and store in $t6
	
	sub $t7, $t5, $t6	#add $t5 with $t6 and store it in $t7

	sw $t7, 0($t3)		#store $t7 into the address of $t8
	
	li $v0, 1		#print integer
	move $a0, $t7		#move $t7 into $a0
	syscall			#system call

	li $a0, 32		#print the ASCII representation of 32 which is space
	li $v0, 11		#system call for printing character
	syscall			#system call

	addi $t1, $t1, 4	#incrementing $t1 by 4
	addi $t2, $t2, 4	#incrementing $t2 by 4
	addi $t4, $t4, 1	#incrementing $t1 by 1
	
	j loop			#go back through the loop
	
final:
	li $v0, 10
	syscall			#end the program
	

