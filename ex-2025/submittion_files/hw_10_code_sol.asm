#----------------------------------------------------------
# Filename: hw_10_code_sol.asm
# Description: Sample assembly code program  that sums all the even elements in an given array.
# Creator: Yitzhak Bar or and Alon Cory
# Editor: Yitzhak Bar or and Alon Cory
# Date Created: January 09, 2025
# Last Edited: January 13, 2025
# Purpose: Demonstrates including creator/editor info in comments
#----------------------------------------------------------
# Here the data of this program : data-code-block (global-pointer)
#----------------------------------------------------------
data:
    start_adrs:             .word 0x10000100 # The array starting from this address
    arr_size_adrs:          .word 0x10000000 # The size of the array written in this address
    sum_even_valus_adrs:    .word 0x10000004 # The sum of even elements will store in this address
#-----------------------------------------------------------
# Here is the program itself : program-code-block (Load data-pointers)
#-----------------------------------------------------------
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
    sw $t0, 0x10000000($zero)   # sw=store_word : save the word in the location of the array size
    lw $t0, 0x10000000($zero)   # $t0 = sizes_of_array (number of elements in the array)
    lui $t1, 0x1000             # points at 0x10000000 $t1 = starts_address (start address of the array)
    ori $t1, $t1, 0x0100        # $s2 = sum (initialize sum to 0)
    ori $t2, $0, 0              # $t0 = index (loop counter) if this is contant
#-----------------------------------------------------------
loop:
    beq $t0, $0, end_loop           # if $t0 = 0 goto endloop
    lw $t3, 0($t1)                  # load the current elemet of the array to $t3
    ori $t4, $t3, 1                 # $t4 = $t3 OR 1
    beq $t4, $t3, skip_add          # if $t4 = $t3 (indicates that the current elemet is odd) goto pointer
    add $t2, $t2, $t3               # $t2 = $t2 + $t3
skip_add:
    addi $t1, $t1, 4            # Increment the index, Increment- index++ becaus every byte is 4 bits
    addi $t0, $t0, -1           # Decremant- index++
    j loop                      # Repeat the loop
#-----------------------------------------------------------
end_loop:
    sw $t2, 0x10000004($zero)   # Store the sum at the specified address, Store sum at M[0x10000004] = $t2
#-----------------------------------------------------------