# Day 9 — Load Balancing, High Availability & Monitoring

**Intern:** Muhammad Anas
**Date:** 26 Oct 2026

## Deliverables

### 1. Load Balancer (Nginx)
- Nginx configured with upstream: `127.0.0.1:8080`, `127.0.0.1:8081`
- 10 requests tested → both instances responded
- Proof: `proofs/nginx-config.txt`

### 2. Failover Test
- Stopped Instance 1 (`capstone.service`)
- Nginx continued serving via Instance 2 (zero downtime)
- Proof: Nginx health check `UP` during failover

### 3. Prometheus Setup
- Prometheus 3.15.1 (Docker)
- Scrape targets: `192.168.29.141:8080`, `192.168.29.141:8081`
- Metrics: `http_server_requests_seconds_count`, `jvm_memory_used_bytes`
- Proof: `proofs/targets.json`, `proofs/rules.json`

### 4. Grafana Dashboard
- Grafana 11.x (Docker)
- Data source: Prometheus (`http://prometheus:9090`)
- Dashboard: `Books API Monitoring`
- Graph: `http_server_requests_seconds_count`
- Proof: `proofs/grafana-dashboard.png`

### 5. Alert (Fired)
- Alert rule: `BooksApiDown` (`up{job="books-api"} == 0`)
- Triggered during failover drill
- Alert state: **pending** (instance 8080 down for >1 min)
- Proof: `proofs/alert-fired.json`

## Lessons Learned
- Nginx upstream = simple, effective load balancer
- Failover with 2 instances ensures zero downtime
- Prometheus + Grafana = powerful monitoring stack
- Alert rules trigger automatically on failures

