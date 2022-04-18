// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// while(true) {
//     probe kbd 
//     if (memory[kbd] > 0) {
//         blacken screen 
//     }
// }
@SCREEN 
D=A
@i 
M=D

@KBD 
D=A 
@lastScreenRegister
M=D-1

(PROGRAMLOOP)
@KBD
D=M 
@BLACKENSCREEN
D-1;JGE

(CLEARSCREEN)
@i 
D=M 
@lastScreenRegister 
D=D-M
@ENDBLACKENSCREEN
D;JGT

@i 
A=M 
M=0

@i 
M=M+1

@CLEARSCREEN
0;JMP

(BLACKENSCREEN)
@i 
D=M 
@lastScreenRegister 
D=D-M
@ENDBLACKENSCREEN
D;JGT

@i 
A=M 
M=-1

@i 
M=M+1

@BLACKENSCREEN
0;JMP

(ENDBLACKENSCREEN)
// Reset start of screen
@SCREEN 
D=A
@i 
M=D


@PROGRAMLOOP
0;JMP