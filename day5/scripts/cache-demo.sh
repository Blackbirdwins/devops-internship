#!/bin/bash
# Cache-aside pattern demo
echo "1. Cache miss (first call)"
redis-cli DEL books:all
time curl -s http://localhost:8080/api/books > /dev/null

echo ""
echo "2. Cache hit (second call)"
time curl -s http://localhost:8080/api/books > /dev/null

echo ""
echo "3. Redis keys"
redis-cli KEYS "books*"
