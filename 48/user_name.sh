#!/bin/bash

BEFAJL="keresztnevekRendezetlen.txt"
KIFAJL="keresztnevek.txt"
RENDEZES=$(sort $BEFAJL -o $KIFAJL)
MEGSZAMLALAS=$(sort $BEFAJL | uniq -c | sort -n)

$RENDEZES
echo "$MEGSZAMLALAS"
