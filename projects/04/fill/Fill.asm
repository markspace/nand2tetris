// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

@SCREEN
D=A
@8192
D=D+A
@screenend
M=D
(LOOP)
    @KBD
    D=M
    @BLACK
    D;JNE
    @WHITE
    0;JMP
(BLACK)
    @colour
    M=0
    M=!M
    @PAINT
    0;JMP
(WHITE)
    @colour
    M=0
(PAINT)
    @SCREEN
    D=A
    @pixel
    M=D
(FILL)
    @colour
    D=M
    @pixel
    A=M
    M=D
    @pixel
    M=M+1
    D=M
    @screenend
    D=M-D
    @FILL
    D;JGT

    @LOOP
    0;JMP

