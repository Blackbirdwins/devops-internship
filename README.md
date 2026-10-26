# DevOps Internship — Day 1 to Day 6

**Intern:** Muhammad Anas
**Program:** 10-Day DevOps & Infrastructure Internship
**Repository:** [devops-internship](https://github.com/Blackbirdwins/devops-internship)

This repository contains the daily deliverables, scripts, configurations, and proofs for the first 6 days of the DevOps Internship.

---

## 📂 Folder Structure

| Folder | Description |
| :--- | :--- |
| `day1drill/` | Linux fundamentals cheat sheet (20 commands). |
| `day2drill/` | Bash scripts (health check, backup) and systemd service setup. |
| `day3/` | Networking incident note (Break/Fix exercise). |
| `day4/` | Nginx config, SSL info, and systemd service proof. |
| `day5/` | MySQL schema, Redis cache demo, backup/restore scripts, and proof files. |
| `capstone/` | Static capstone app (index.html, healthz). |

---

## 🛠️ Day-by-Day Deliverables

### Day 1: Linux Fundamentals
*   **Task:** Navigate Linux, inspect processes, read logs, manage permissions.
*   **Deliverable:** 20-command cheat sheet.
*   **Proof:** `day1drill/DAY1-CHEATSHEET.md`

### Day 2: Shell Scripting & Systemd
*   **Task:** Write health-check and backup scripts; run app as a systemd service.
*   **Deliverable:** Capstone running as a self-healing systemd service.
*   **Proof:** `day2drill/backup.sh`, `day2drill/health-check.sh`, `day4/systemd-service.txt`

### Day 3: Networking for Developers
*   **Task:** Trace requests, diagnose DNS/port issues, inspect SSL/TLS handshake.
*   **Deliverable:** Break/fix incident note.
*   **Proof:** `day3/incident-note.md`

### Day 4: Web Servers & Reverse Proxy
*   **Task:** Install Nginx, configure reverse proxy, terminate SSL at Nginx.
*   **Deliverable:** Capstone reachable over HTTPS via Nginx.
*   **Proof:** `day4/nginx-config.txt`, `day4/ssl-info.txt`, `day4/test-output.txt`

### Day 5: MySQL & Redis in Production
*   **Task:** Design schema, load seed data, use EXPLAIN, add index, backup/restore, add Redis cache.
*   **Deliverable:** Capstone reads/writes MySQL, caches with Redis, backup/restore documented.
*   **Proof:** `day5/day5-report.md`, `day5/proofs/`, `day5/sql/`, `day5/scripts/`

### Day 6: Docker & Compose
*   **Task:** Write Dockerfile, create Compose file (App + MySQL + Redis), launch full stack.
*   **Deliverable:** `docker compose up` launches the full capstone stack.
*   **Proof:** `day6/docker-compose.yml`, `day6/docker-ps.txt`, `day6/docker-app-logs.txt`

### Day 7: Git Workflows & Jenkins CI/CD
*   **Task:** Build a Jenkins pipeline to test, build, and publish a Docker image.
*   **Deliverable:** Push to main auto-tests, builds, and publishes the capstone image.
*   **Proof:** `Jenkinsfile`, `day7/jenkins-build-log.txt`, `day7/docker-pull-proof.txt`
*   **Docker Hub Image:** `blackbirdwins/books-api:latest`

### Day 8: Kubernetes Fundamentals
*   **Task:** Deploy app to K8s with ConfigMap, Secret, health probes, and test rolling updates/rollbacks.
*   **Deliverable:** Capstone running on a local cluster behind an Ingress, with working probes and a demonstrated rollback.
*   **Proof:** `day8/k8s/` (all YAML manifests), `day8/proofs/` (pods, services, health, rollout history)
*   **Minikube IP:** `192.168.49.2`
*   **App URL:** `http://192.168.49.2:30080/actuator/health` (returns `{"status":"UP"}`)

### Day 9: Load Balancing, High Availability & Monitoring
*   **Task:** Put the app behind a load balancer with health checks, expose metrics scraped by Prometheus, and visualize them in Grafana.
*   **Deliverable:** Dashboard screenshot and a fired alert from the failover drill, committed to the repo docs.
*   **Proof:** `day9/prometheus/`, `day9/docker-compose.yml`, `day9/proofs/`, `day9/day9-report.md`
*   **Key Components:**
    *   Nginx Load Balancer (upstream: `8080`, `8081`)
    *   Prometheus (metrics scraping)
    *   Grafana (dashboard: Books API Monitoring)
    *   Alert Rule: `BooksApiDown` (fired during failover drill)

---

## 🚀 Tech Stack Used
*   **OS:** Ubuntu 24.04
*   **Web Server:** Nginx
*   **App Runtime:** Java 17 / Spring Boot 3.5.6
*   **Database:** MySQL 8.0
*   **Cache:** Redis 7.0
*   **Containerization:** Docker & Docker Compose
*   **Security:** SSL/TLS (self-signed), JWT Authentication

---

## 📸 Proofs
All proof files (health checks, docker ps, logs) are committed inside their respective day folders.

---
*This README was generated as part of the DevOps Internship deliverables.*
