#----------------------------------------------------------- 
# This program processes an array of integers.
# The size of the array is written in address 0x10000000.
# And sum up all the elements that have even values in the array
# element in a sorted array of "arr_size" 
# starting from the address written in "strt_adrs" 
# and writes the index of the element to "index" 
# We implement a __________ algorithm: 
# 
# 
#----------------------------------------------------------- 
# Here the data of this program starts 
#-----------------------------------------------------------
section .data
    size_addr   dd 0x10000000  ; Address storing the size of the array
    array_start dd 0x10000100  ; Starting address of the array
    result_addr dd 0x10000004  ; Address to store the result
section .text
global _start
_start:
#-------------------------- Load the size of the array ---------------------------------

    mov eax, [0x10000000]      ; eax = size of the array
    mov ecx, eax              ; ecx = counter (number of elements to process)
    ; Initialize sum to 0
    xor ebx, ebx              ; ebx = sum = 0
    ; Load the starting address of the array
    mov esi, 0x10000100       ; esi points to the start of the array
sum_loop:
    ; Exit loop if counter reaches 0
    cmp ecx, 0
    je end_loop
    ; Load the current element into eax
    mov eax, [esi]            ; eax = *esi
    ; Check if the element is even
    test eax, 1               ; Check if eax is odd (eax & 1)
    jnz skip_even             ; If odd, skip addition
    ; Add the even element to the sum
    add ebx, eax              ; ebx += eax
skip_even:
    ; Move to the next element
    add esi, 4                ; Increment pointer to next element
    dec ecx                   ; Decrement the counter
    jmp sum_loop              ; Repeat the loop
end_loop:
    ; Store the result in the result address
    mov [0x10000004], ebx     ; *result_addr = sum
    ; Exit program (optional)
    mov eax, 60               ; syscall: exit
    xor edi, edi              ; exit code 0
    syscall
