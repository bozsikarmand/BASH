#!/bin/bash

N=$1
DIR=$2

if [[ $# -eq 0 ]]; then
  echo Nem adott meg parametert!
  echo
  echo Hasznalat: "$0" szam /utvonal/ahonnan/torlunk
  echo
  echo Az elso parameter megadasa kotelezo!
  echo A masodik parameter megadasa kotelezo!
  exit 1
fi
if [[ $# -eq 1 ]]; then
  echo Csak az elso parametert adta meg! A masodik is kotelezo!
  exit 1
fi
if [[ $# -eq 2 ]]; then
  echo Mindket parametert megadta, igy az adott mennyisegu legtobbet foglalo kozonseges fajl kerul kiiratasra a megadott utvonalrol.
  # Adott kt fajlajainak merete
  # hetkoznapi formaban
  # visszafele
  # majd a head-del kiveszem az N sort
  find $DIR -xtype f -exec du -a {} + | sort -rh | head -n $N
fi
