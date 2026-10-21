#!/bin/bash
LATEST=$(ls -t ~/Documents/Devops/day5/backups/*.sql | head -1)
mysql -u books_user -pBook@1234 -e "DROP DATABASE books_db; CREATE DATABASE books_db;"
mysql -u books_user -pBook@1234 books_db < $LATEST
echo "✅ Restored: $LATEST"
