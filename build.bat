@echo off
pause
wla-6502 -o main.asm build.o
wlalink -v link.txt build.nes
pause