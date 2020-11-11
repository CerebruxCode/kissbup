#!/bin/bash
#   (c)2020 Kissbup | Salih Emin
#   LICENSED under Apache 2.0 

SOURCE_DIR="/home/username/BackupThis" # Τι κάνω backup
DEST_DIR="/media/diskos/kissbups/" # Που κάνω backup
NAME_BACKUP="mybackup-$(date +%d-%m-%Y)" # Τι όνομα να έχει το backup
BACKUP_NUM="10" # Συνολικά backup που πρέπει να διατηρούνται εάν δημιουργείται αντίγραφα καθημερινά

# Συμπίεση backups
tar -zcpvf "$DEST_DIR"/"$NAME_BACKUP".tar.gz "$SOURCE_DIR"
# Αναζητήσε αντίγραφα ασφαλείας παλαιότερα από BACKUP_NUM και διαγράψτε τα
find "$DEST_DIR"/* -mtime +$BACKUP_NUM -exec rm {} \;
