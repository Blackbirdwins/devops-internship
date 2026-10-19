# Day 5 — MySQL & Redis in Production

**Intern:** Muhammad Anas
**Date:** 19 Oct 2026
**Project:** Capstone Books API (Spring Boot 3.5.6)
**Deliverable:** Indexed schema, cache, tested backup/restore

---

## 1. Objective

Per the 10-Day DevOps Internship Plan (Day 5), the goal was:

> "Design the capstone schema, load seed data, and write the app's queries; use EXPLAIN to find one deliberately slow query, add an index, and measure the before/after difference. Take a mysqldump backup, drop the database, and restore it successfully. Add Redis cache-aside to the hottest endpoint and measure the latency change."

---

## 2. What Was Done

### 2.1 MySQL Setup

| Item | Detail |
|------|--------|
| Database | `books_db` |
| User | `books_user` |
| MySQL version | 8.0.46 (Ubuntu) |
| Tables | `books`, `users`, `publishers`, `audit_logs` |
| Seed data | 10 books (sample data) |

**Config** (from `application-dev.properties`):
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/books_db
spring.datasource.username=books_user
spring.datasource.password=Book@1234
spring.jpa.hibernate.ddl-auto=update
2.2 Spring Boot JAR + Systemd Service
Built JAR: books-api-0.0.1-SNAPSHOT.jar (104 MB)

Copied to: ~/Documents/Devops/day5/app/books-api.jar

Systemd service: capstone.service (active, running)

Port: 8080

Profile: dev

2.3 Redis Cache Migration (Caffeine → Redis)
Original (Day 8 project):

properties
spring.cache.type=caffeine
spring.cache.caffeine.spec=maximumSize=100,expireAfterWrite=600s
Changed to (Day 5):

properties
spring.cache.type=redis
spring.redis.host=localhost
spring.redis.port=6379
spring.redis.timeout=60000
spring.cache.redis.time-to-live=600000
spring.cache.cache-names=books,booksById
RedisConfig (config/RedisConfig.java) — added JavaTimeModule to fix LocalDate serialization:

java
@Bean
public RedisCacheConfiguration cacheConfiguration() {
    ObjectMapper mapper = new ObjectMapper();
    mapper.registerModule(new JavaTimeModule());
    mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
    GenericJackson2JsonRedisSerializer serializer =
        new GenericJackson2JsonRedisSerializer(mapper);
    return RedisCacheConfiguration.defaultCacheConfig()
        .serializeValuesWith(
            RedisSerializationContext.SerializationPair.fromSerializer(serializer)
        );
}
2.4 Cache-Aside Test (Latency)
Call	Time	Source
First (MISS)	0.034s	MySQL
Second (HIT)	0.027s	Redis
Redis key created: books::all

2.5 EXPLAIN + Index Optimization
Index: idx_books_title on books(title) (BTREE)

Query	type	key	rows	Extra
LIKE '%java%'	ALL	NULL	9	Using where (full scan)
LIKE 'Clean%'	range	idx_books_title	4	Using index condition
= 'Clean Code'	ref	idx_books_title	4	NULL
Conclusion: Prefix search (LIKE 'Clean%') and exact match use the index. Leading wildcard (LIKE '%java%') forces full scan — expected MySQL behavior.

2.6 Backup + Restore Test
bash
# Backup
mysqldump -u books_user -pBook@1234 books_db > backups/books_db-20261019-134457.sql
# File size: 5.7 KB

# Drop + Restore
mysql -u books_user -pBook@1234 -e "DROP DATABASE books_db; CREATE DATABASE books_db;"
mysql -u books_user -pBook@1234 books_db < backups/books_db-20261019-134457.sql

# Verify
SELECT COUNT(*) AS total FROM books;
# → 10 ✅
3. Proofs (in proofs/ folder)
File	Content
01-actuator-health.json	MySQL UP + Redis UP
02-books-api.json	10 books JSON (API response)
03-redis-keys.txt	books::all
04-systemd-status.txt	active (running)
05-mysql-tables.txt	4 tables, 10 books
06-backup-files.txt	2 backup files
07-explain-index.txt	EXPLAIN with index (range)
Screenshots (in screenshots/ folder):

Actuator health (MySQL + Redis UP)

Books API (10 books JSON)

Redis keys (books::all)

Latency test (MISS vs HIT)

EXPLAIN before/after

Backup/restore verify

Systemd status (active)

4. Issues Faced + Fixes
Issue	Fix
BookResponseDTO not serializable (Redis JDK serializer)	Added RedisConfig with JSON serializer
LocalDate not supported by Jackson	Added JavaTimeModule in RedisConfig
Port 8080 conflict (IDEA + systemd)	Killed IDEA Java process (kill -9 <PID>)
mysqldump PROCESS privilege warning	Non-blocking — backup created successfully
ambiguous redirect (*.sql multiple files)	Used ls -t ... | head -1 to pick latest backup
5. Lessons Learned
Redis serialization — Default JDK serializer needs Serializable; JSON serializer is better for DTOs with LocalDate.

Cache-aside pattern — First call (MISS) hits DB, second (HIT) hits Redis — latency difference proves cache working.

EXPLAIN + index — Prefix/exact match uses index; leading wildcard (%...) forces full scan.

Backup/restore — mysqldump + mysql < file is the standard procedure; test it before production.

Port conflicts — IDEA + systemd both on 8080 → kill one before starting the other.
