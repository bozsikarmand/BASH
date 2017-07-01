#!/bin/bash

LOG="$IMAGE_DB_DIR/log/kotelezo1.log"
LOG_DIR="$IMAGE_DB_DIR/log/"
FULL_DIR="$IMAGE_DB_DIR/full"
MEDIUM_DIR="$IMAGE_DB_DIR/medium"
THUMB_DIR="$IMAGE_DB_DIR/thumb"
FAJLLISTA=("$@")
DATUM=$(date +%Y-%m-%d-%H:%M:%S)
ELVALASZTO="_"
KITERJESZTES=".jpg"

if [[ $# -eq 0 ]]; then
  echo Hasznalat: kotelezo_1.sh <file> [file ...]
fi
if [[ $# -gt 0 ]]; then
  if [[ -d $IMAGE_DB_DIR ]]; then
    mkdir -p $LOG_DIR
    mkdir -p $FULL_DIR
    mkdir -p $MEDIUM_DIR
    mkdir -p $THUMB_DIR
    touch $LOG

    for FAJL in "${FAJLLISTA[@]}";
    do
      {
        FAJLNEV=$(basename "$FAJL" | cut -d. -f1)
        FAJLNEVKITERJESZTESSEL=$(basename "$FAJL")
        TELJESFAJLNEV="$FAJLNEV$ELVALASZTO$DATUM$KITERJESZTES"
        cp "$FAJL" "$FULL_DIR"
        cp "$FAJL" "$MEDIUM_DIR"
        cp "$FAJL" "$THUMB_DIR"

        cd "$FULL_DIR"

        if [[ -f $FAJL ]]; then
          echo A megadott fajl lemasolasra kerult a $FULL_DIR mappaba!
        fi

        cd "$MEDIUM_DIR"

        if [[ -f $FAJL ]]; then
          echo A megadott fajl lemasolasra kerult a $MEDIUM_DIR mappaba!
          echo Most elkeszitjuk az 50% nagysagu masolatot jpg kiterjesztessel
        fi

        convert $FAJL -resize 50% $TELJESFAJLNEV
        rm $MEDIUM_DIR/$FAJLNEVKITERJESZTESSEL

        cd "$THUMB_DIR"

        if [[ -f $FAJL ]]; then
          echo A megadott fajl lemasolasra kerult a $MEDIUM_DIR mappaba!
          echo Most elkeszitjuk a 10% nagysagu masolatot jpg kiterjesztessel
        fi

        convert $FAJL -resize 10% $TELJESFAJLNEV
        rm $THUMB_DIR/$FAJLNEVKITERJESZTESSEL

        printf "%s: %s -> %s" "$DATUM" "$FAJL" "$TELJESFAJLNEV" > $LOG
      }
    done
  else
    echo Az IMAGE_DB_DIR valtozoban szereplo utvonal nem talalhato. Kilepes.
    exit 1
  fi
fi
