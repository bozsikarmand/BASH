#!/bin/bash

KONYVTAR=$1

if [[ $# -eq 0 ]]; then
  echo Hasznalat: "$0" /konyvtar/eleresi/utja
fi
if [[ $# -eq 1 ]]; then
  # azokat a konyvtarakat amik nem 770 jogosultsaguak, tehat nem rwxrwx---
  # ill. prune-nal kizarom a konyvtarakat amire mindenkinek iras joga van
  # listazok
  find $KONYVTAR -not -perm 770 -type d -o -prune -perm -a+w -ls
fi
