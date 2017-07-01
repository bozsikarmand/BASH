#!/bin/bash

BEMENET=$1
EV=${BEMENET:0:4}
HO=${BEMENET:4:2}
NAP=${BEMENET:6:2}
EGYBEN=$EV$HO$NAP
MELYIKNAP=$(date -d $EGYBEN "+%A")

if [[ $# -eq 0 ]]; then
  echo Nem adott meg parametert!
  echo
  echo Hasznalat: "$0" YYYYMMDD
  echo
  echo A parameter megadasa kotelezo!
  echo A parameter egy datum a fenti formaban. Errol kerul megallapitasra, hogy milyen napra esik.
  exit 1
fi
if [[ $# -eq 1 ]]; then
  if [[ "$MELYIKNAP" == "hétfő" ]]; then
    echo he
  fi
  if [[ "$MELYIKNAP" == "kedd" ]]; then
    echo ke
  fi
  if [[ "$MELYIKNAP" == "szerda" ]]; then
    echo sze
  fi
  if [[ "$MELYIKNAP" == "csütörtök" ]]; then
    echo csu
  fi
  if [[ "$MELYIKNAP" == "péntek" ]]; then
    echo pe
  fi
  if [[ "$MELYIKNAP" == "szombat" ]]; then
    echo szo
  fi
  if [[ "$MELYIKNAP" == "vasárnap" ]]; then
    echo va
  fi
fi
