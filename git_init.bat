@echo off

git init
pause
git remote add origin https://github.com/Peniaze/Mikrokotina.git
pause
git fetch
pause
git reset --hard origin/master
pause
DEL "%~f0"

