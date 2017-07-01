#!/bin/bash

KERESESIUTVONAL=$1
TOROLTFAJLOKLISTAJA=$2

if [[ $# -eq 0 ]]; then
  echo Nem adott meg parametert!
  echo
  echo Hasznalat: "$0" /utvonal/ut/ahol/torlunk /utvonal/ahova/mentjuk/a/torolt_fajlok_listaja.txt fajlt
  echo
  echo Az elso parameter megadasa kotelezo!
  echo A masodik parameter opcionalis. Amennyiben nem kerul megadasra, csak a torles muvelet kerul elvegzesre, a fajl lista lementese nem!
  exit 1
fi
if [[ $# -eq 1 ]]; then
  echo Csak az elso parametert adta meg! A torott szimbolikus linkeket csak torlom, lista roluk nem keszul!
  find $KERESESIUTVONAL -xtype l -delete
fi
if [[ $# -eq 2 ]]; then
  echo Mindket parametert megadta, igy a torott szimbolikus linkeket torlom es elmentem a masodik parameterben megadott fajlba.
  find $KERESESIUTVONAL -xtype l > $2
  find $KERESESIUTVONAL -xtype l -delete
fi
