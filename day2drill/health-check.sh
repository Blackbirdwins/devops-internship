#!/bin/bash

URL="${1:-http://localhost:8000}"
LOG_FILE="/home/anas/Documents/Devops/day2drill/health.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "$URL")

if [ "$STATUS" = "200" ]; then
  echo "$TIMESTAMP | $URL | STATUS=$STATUS | OK" >> "$LOG_FILE"
  echo "✅ $URL is UP (HTTP $STATUS)"
else
  echo "$TIMESTAMP | $URL | STATUS=$STATUS | FAILED" >> "$LOG_FILE"
  echo "❌ $URL is DOWN (HTTP $STATUS)"
fi
