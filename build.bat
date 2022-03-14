@echo off

cd ./build
xc8 --chip=16f917 --warn=1 ../main.c

pause
