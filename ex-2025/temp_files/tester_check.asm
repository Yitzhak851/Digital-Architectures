#-----------------------------------------------------------
# This program sums all even elements in an array
# starting at the address written in "strt_adrs"
# and writes the result to "sum_addr"
#-----------------------------------------------------------

// switch between $t1  to  $s1 ??
main:
    addi $s0, 

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