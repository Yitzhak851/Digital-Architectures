data: 
	start_adrs:             .word 0x10000100 # Starting from address 0x10000100
	arr_size_adrs:          .word 0x10000000 # The size of the array written in address 0x1
	sum_even_valus_adrs:    .word 0x10000004 # Address to store the sum of even 

main:
			addi $t0, $0, 1
			sw $t0, 0x10000100($zero)
			addi $t0, $0, 2
			sw $t0, 0x10000104($zero)
			addi $t0, $0, 3
			sw $t0, 0x10000108($zero)
			addi $t0, $0, 4
			sw $t0, 0x1000010C($zero)
			addi $t0, $0, 5
			sw $t0, 0x10000110($zero)
			addi $t0, $0, 4
			sw $t0, 0x10000000($zero)
			lw $t0, 0x10000000($zero) # saves array's length to $t0
			lui $t1 , 0x1000 # $t1 = 0x10000000
			ori $t1, $t1 , 0x0100 # $t1 = 0x10000100
			ori $t2, $0, 0 # $t2 = 0
	loop:	beq $t0, $0,  endloop # if $t0 = 0 goto endloop
			lw $t3, 0($t1) # loads the current elemet of the array to $t3
			ori $t4, $t3, 1 # $t4 = $t3 OR 1
			beq $t4, $t3, pointer # if $t4 = $t3 (indicates that the current elemet is odd) goto pointer
			add $t2, $t2, $t3 # $t2 = $t2 + $t3
pointer: 	addi $t1, $t1, 4 # $t1 = $t1 + 4
			addi $t0 , $t0 , -1 # $t0 = $t0 - 1
			j loop # jump to loop
endloop: 	sw $t2, 0x10000004($zero) # M[0x10000004] = $t2
		

