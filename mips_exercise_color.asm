.globl main

.data
Display_Addr: .word 0x10010000

.text

main: 
   lw $t0, Display_Addr
   li $t3, 128
   li $t4, 0x02
   li $t5, 0x01

loop:
   div $t8, $t5, 0x02
   mfhi $t6
   beqz $t6, is_even
   li $t1, 0x00000000 
   sw $t1, 0($t0)

   addi $t0, $t0, 4

   li $t1, 0xFFFFFFFF 
   sw $t1, 0($t0)

   addi $t0, $t0, 4

   sub $t3, $t3, $t4
   beqz $t3, stop
   move $t7, $t3
   div $t7, $t7, 16
   mfhi $t6
   bnez $t6, loop
   add $t5, $t5, 0x01

   j loop

   is_even:
      li $t1, 0xFFFFFFFF 
      sw $t1, 0($t0)

      addi $t0, $t0, 4

      li $t1, 0x00000000 
      sw $t1, 0($t0)

      addi $t0, $t0, 4

      sub $t3, $t3, $t4
      beqz $t3, stop
      move $t7, $t3
      div $t7, $t7, 16
      mfhi $t6
      bnez $t6, loop
      add $t5, $t5, 0x01
      j loop
 stop: 
   li $v0, 10
   syscall
