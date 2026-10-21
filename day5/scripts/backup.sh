#!/bin/bash
BACKUP_DIR=~/Documents/Devops/day5/backups
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
mysqldump -u books_user -pBook@1234 books_db > $BACKUP_DIR/books_db-$TIMESTAMP.sql
echo "✅ Backup: $BACKUP_DIR/books_db-$TIMESTAMP.sql"
