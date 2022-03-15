@echo off

cd ./build
xc8 --chip=16f917 ../main.c ../uart.c

pause
