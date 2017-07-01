#!/bin/bash

FAJL=$1

# A leghosszabb egyezest vagom a sor kezdetetol
echo ${FAJL##*/}
