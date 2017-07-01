#!/bin/bash

ps -e --sort -cmd | awk '{print $1,"\t",$4}'

echo
echo Egyezo processzek leallitasa? PID:
read AZONOSITO

kill $AZONOSITO

ps -e --sort -cmd | awk '{print $1,"\t",$4}'
