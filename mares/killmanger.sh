#!/bin/bash

./manger &

sleep 1

pkill -4 podargos
pkill -5 lampon
pkill -10 xanthos
pkill -11 deinos
pkill -4 yes

kill -s KILL $(top -l 1 | grep manger | awk '{print $1}')

rm -rf *crap*poo*

gcc -o my_manger my_manger.c

./my_manger &

sleep 5

pkill my_manger

rm -rf my_manger

echo "killed my horse (ﾉﾟ0ﾟ)ﾉ~"
