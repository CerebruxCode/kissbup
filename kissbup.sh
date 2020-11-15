#!/bin/bash
#   (c)2020 Kissbup | Salih Emin
#   LICENSED under Apache 2.0 

SOURCE_DIR=(
 /home/username/BackupThis 
 /home/username/BackupAlsoThis 
 /home/username/BackupANDThis
 /home/username/.BackupHidden
 ) # Τι κάνω backup. Κάθε γραμμή είναι ένας φάκελος με αρχεία ή ένα αρχείο

DEST_DIR="/media/diskos/kissbups/"        # Που κάνω backup
NAME_BACKUP="mybackup-$(date +%d-%m-%Y)" # Τι όνομα να έχει το backup
BACKUP_NUM="10"                         # Συνολικά backup που πρέπει να διατηρούνται εάν δημιουργείται αντίγραφα καθημερινά

# Συμπίεση των backups με pigz για πράλληλη συμπίεση και χρήση όλων των πυρήνων της CPU
# Μπορείτε να χρησιμοποείσετε στο "--use-compress-program=" τα: gzip, pigz, xz, pxz, bzip2, pbzip2 κλπ.
# αρκεί να το κάνετε εγκατάσταση στο σύστημα σας. Μην ξεχάσετε να αλλάξετε και την αντίστοιχη κατάλληξη
# του αρχείου π.χ. gzip --> tar.gz, xz --> tar.xz κλπ.
tar -cpvf "$DEST_DIR"/"$NAME_BACKUP".tar.gz --use-compress-program=pigz "${SOURCE_DIR[@]}"
# Αναζήτησε αντίγραφα ασφαλείας παλαιότερα από τον αριθμό ημερών που έχουν δηλωθεί στο "BACKUP_NUM" και διαγράψτε τα
find "$DEST_DIR"/* -mtime +$BACKUP_NUM -exec rm {} \;
