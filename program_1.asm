
    .data
num1:       .word       0   
num2:       .word       0    
max:        .word       0      
msg:        .asciiz     "Enter an integer: "        
msg2:       .asciiz     "The bigger value is: "     

    .text

    .globl main
main:

    li      $v0, 4       # Print msg to screen
    la      $a0, msg
    syscall

    li      $v0, 5       # Read in user input, integer
    syscall
    sw      $v0, num1    # Store integer in main memory as num1

    li      $v0, 4       # Print msg to screen
    la      $a0, msg
    syscall
    
    li      $v0, 5       # Read in user input, integer
    syscall
    sw      $v0, num2    # Store integer in main memory as num2

    lw      $s0, num1    # Load num1 into $s0
    lw      $s1, num2    # Load num2 into $s1

    bgt     $s0, $s1, num1Max  # branch if $s0 > $s1
    sw	 $s1, max 
    j       end    

num1Max:

    sw      $s0, max     # Store $s0 into max
    j       end          # Jump to ContinueMain
       

end:

    li      $v0, 4       # Print msg2 to screen
    la      $a0, msg2
    syscall

    lw      $t0, max     # Load max into $t0
    
    li      $v0, 1       # Print $t0 to screen
    move    $a0, $t0     # move $t0 to $a0
    syscall

    li      $v0, 10      # End program
    syscall


