#!/bin/bash

rm lex.yy.c archangel.tab.h archangel.tab.c y.tab.c y.tab.h archangel.exe  

flex $1 
echo "Flex Scanned"
bison -d $2
echo "Bison Parsed"
flexf="$1"
bisonf="$2"

flexf=${flexf%.l}
bisonf=${bisonf%.y}

cpfi1=$(ls $flexf.tab.c)
cpfi2=$(ls $bisonf.tab.h)
echo "Files Copied"
cp -i $cpfi1 y.tab.c
cp -i $cpfi2 y.tab.h

gcc -o archangel.exe y.tab.c
echo "GCC Compiled"

./archangel.exe
