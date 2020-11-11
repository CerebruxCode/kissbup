#!/bin/bash

SOURCE_DIR="/home/username/BackupThis"
DEST_DIR="/media/diskos/kissbups/"
NAME_BACKUP="mybackup-$(date +%d-%m-%Y)"
BACKUP_NUM="10"

tar -zcpvf "$DEST_DIR"/"$NAME_BACKUP".tar.gz "$SOURCE_DIR"
find "$DEST_DIR"/* -mtime +$BACKUP_NUM -exec rm {} \;
