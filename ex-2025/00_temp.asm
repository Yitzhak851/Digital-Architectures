#-----------------------------------------------------------
# This program sums all even elements in an array
# starting at the address written in "strt_adrs"
# and writes the result to "sum_addr"
#-----------------------------------------------------------

# Data block - Global-pointer (gb)
.data 0x10000100
start_adrs:             .word 0x10000100 # Starting from address 0x10000100
arr_size_adrs:          .word 0x10000000 # The size of the array written in address 0x1
sum_even_valus_adrs:    .word 0x10000004 # Address to store the sum of even elements

# Code block
.text 0x00400000
main:
# Load data pointers
    addi $t0, $0, 1
    sw $t0, 0x10000100($zero)
    addi $t0, $0, 2
    sw $t0, 0x10000104($zero)
    addi $t0, $0, 3
    sw $t0, 0x10000108($zero)

    lui $gp, 0x1000         # $gp points at 0x10000000
    lw $s0, 0($gp)          # $s0 = sizes_of_array (number of elements in the array)
    lw $s1, 8($gp)          # $s1 = starts_address (start address of the array)
    add $s2, $0, $0         # $s2 = sum (initialize sum to 0)
    add $t0, $0, $0         # $t0 = index (loop counter)
loop:
# Check if index >= arr_size
    slt $t3, $t0, $s0       # $t3 = 1 if index < arr_size, else $t3 = 0
    beq $t3, $0, end_loop   # If index >= arr_size, exit the loop
# Calculate the current element's address
    add $t1, $t0, $t0       # $t1 = 2 * index
    add $t1, $t1, $t1       # $t1 = 4 * index
    add $t1, $t1, $s1       # $t1 = address of the current element
# Load the current element
    lw $t2, 0($t1)# $t2 = current element (A[index])
# Check if the element is even
    andi $t3, $t2, 1        # $t3 = A[index] & 1
    bne $t3, $0, skip_add   # If the element is odd, skip the addition
# Add the even element to the sum
    add $s2, $s2, $t2 # sum += A[index]
skip_add:
# Increment the index
    addi $t0, $t0, 1 # index++
# Repeat the loop
    j loop
end_loop:
# Store the sum at the specified address
    sw $s2, 4($gp)# Store sum at 0x10000004
# End the program (loop indefinitely)
    j end_loop