#!/bin/bash

SOURCE="${1:-/home/anas/Documents/Devops/capstone}"
BACKUP_DIR="/home/anas/Documents/Devops/backups"
TIMESTAMP=$(date '+%Y%m%d-%H%M%S')
BACKUP_FILE="$BACKUP_DIR/backup-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" -C "$(dirname $SOURCE)" "$(basename $SOURCE)"

if [ $? -eq 0 ]; then
  SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
  echo "✅ Backup complete: $BACKUP_FILE ($SIZE)"
else
  echo "❌ Backup failed!"
  exit 1
fi

find "$BACKUP_DIR" -name "backup-*.tar.gz" -mtime +7 -delete
echo "🧹 Old backups cleaned"
