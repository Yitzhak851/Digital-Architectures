#----------------------------------------------------------
# Description: Program that sums all the even elements in an given array.
# Creator and Editor: Yitzhak Bar or && Alon Cory
# Date Created: January 09, 2025
# Last Edited: January 14, 2025
#----------------------------------------------------------
# Data-code-block
#----------------------------------------------------------
data:
    start_adrs:             .word 0x10000100 # Starting memory address of the array
    arr_size_adrs:          .word 0x10000000 # Memory address holding the array size
    sum_even_values_adrs:   .word 0x10000004 # Memory address to store the sum of even numbers
#-----------------------------------------------------------
main:
    sw $t0, 0x10000000($zero)   # store the word in the location of the array size
    lw $t0, 0x10000000($zero)   # $t0 = sizes_of_array (number of elements in the array)
    lui $t1, 0x1000             # points at 0x10000000 $t1 = starts_address (start address of the array)
    ori $t1, $t1, 0x0100        # $s2 = sum (initialize sum to 0)
    ori $t2, $0, 0              # $t0 = index (loop counter) if this is contant
#-----------------------------------------------------------
loop:
    beq $t0, $0, end_loop       # Exit loop if the index (loop counter) is 0
    lw $t3, 0($t1)              # Load the current array element into $t3
    ori $t4, $t3, 1             # Perform bitwise OR with 1 to check if the value is even
    beq $t4, $t3, skip_add      # If $t4 equals $t3,(current element is odd) skip addition
    add $t2, $t2, $t3           # Add the even value to the running sum
skip_add:
    addi $t1, $t1, 4            # Move to the next array element (4 bytes forward)
    addi $t0, $t0, -1           # Decrement the index (loop counter)
    j loop                      # Jump back to the start of the loop/ repeat the loop
#-----------------------------------------------------------
end_loop:
    sw $t2, 0x10000004($zero)   # Store the sum at address 0x10000004