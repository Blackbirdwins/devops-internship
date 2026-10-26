# DevOps Internship — Day 1 to Day 9 Summary

**Intern:** Muhammad Anas
**Repo:** https://github.com/Blackbirdwins/devops-internship

---

## Day 1 — Linux Fundamentals
**Kya Seekha:** File system (`/etc`, `/var`, `/home`), core commands (`cp`, `mv`, `rm`, `find`, `grep`, `sed`, `awk`, `cat`, `tail`, `sort`, `wc`, `echo`), system inspection (`ps`, `top`, `free`, `df`, `du`, `mount`), permissions (`chmod`, `chown`).
**Kya Kiya:** 20 commands ki cheat sheet banayi. Logs check kiye (`grep`, `tail`).
**Proof:** `day1drill/DAY1-CHEATSHEET.md`

---

## Day 2 — Shell Scripting, Processes & Systemd
**Kya Seekha:** Bash scripting (variables, loops, functions), process management (`ps`, `kill`, `jobs`), systemd (unit files, `systemctl`, `journalctl`).
**Kya Kiya:** Health-check script aur backup script banayi. Capstone app ko `capstone.service` systemd service mein daala. `Restart=on-failure` aur `systemctl enable` lagaya.
**Proof:** `day2drill/backup.sh`, `day2drill/health-check.sh`, `/etc/systemd/system/capstone.service`

---

## Day 3 — Networking
**Kya Seekha:** TCP/IP, ports, DNS, DHCP vs Static IP, HTTP vs HTTPS, SSL/TLS handshake.
**Kya Kiya:** `ss -tuln` se ports check kiye. `nmcli` se static IP (`192.168.29.141`) set kiya. HTTPS request test ki.
**Proof:** `day3/incident-note.md`

---

## Day 4 — Web Servers & Reverse Proxy (Nginx)
**Kya Seekha:** Nginx as reverse proxy, SSL termination, HTTPS setup.
**Kya Kiya:** Nginx install kiya, `sites-available/capstone` config banayi, port 443 pe SSL lagaya, HTTP → HTTPS redirect set kiya. OpenSSL se self-signed cert generate kiya.
**Proof:** `day4/nginx-config.txt`, `day4/ssl-info.txt`, `day4/test-output.txt`

---

## Day 5 — MySQL & Redis in Production
**Kya Seekha:** MySQL schema, indexes, EXPLAIN, mysqldump backup/restore. Redis cache-aside pattern, TTL.
**Kya Kiya:** `books_db` database banaya, `books_user` user banaya. Capstone schema (books, users, notes, publishers, audit_logs) banaya. `idx_books_title` index lagaya. Redis cache-aside implement kiya (`books::all` key). Backup/restore test kiya.
**Proof:** `day5/day5-report.md`, `day5/sql/`, `day5/scripts/`, `day5/proofs/`

---

## Day 6 — Docker & Docker Compose
**Kya Seekha:** Docker images, containers, multi-stage Dockerfile, Docker Compose.
**Kya Kiya:** Spring Boot app ke liye multi-stage `Dockerfile` banayi. `docker-compose.yml` banayi (App + MySQL + Redis). `docker-compose up` se poora stack launch kiya.
**Proof:** `day6/docker-compose.yml`, `day6/docker-ps.txt`, `day6/docker-app-logs.txt`

---

## Day 7 — Git Workflow & Jenkins CI/CD
**Kya Seekha:** Git branching, Jenkins pipelines (Jenkinsfile), Docker Hub registry.
**Kya Kiya:** Jenkins install kiya (Docker se). `Jenkinsfile` likhi jisme 3 stages: Build (Maven), Docker Build, Docker Push. Docker Hub pe image push ki (`blackbirdwins/books-api:latest`).
**Proof:** `Jenkinsfile`, `day7/jenkins-build-log.txt`, `day7/docker-pull-proof.txt`

---

## Day 8 — Kubernetes (Systemd Fallback)
**Kya Seekha:** Kubernetes concepts (Pods, Deployments, Services, ConfigMaps, Secrets, health probes, rolling updates, rollbacks).
**Kya Kiya:** Minikube install kiya, manifests banaye (`secret.yaml`, `configmap.yaml`, `mysql.yaml`, `redis.yaml`, `app.yaml`), K8s pe deploy kiya. Health probes lagaye, rolling update test kiya, rollback test kiya.
**Issue:** K8s mein Redis `localhost` issue aaya, toh **systemd fallback** use kiya.
**Systemd Deliverables:** App systemd se chal rahi hai, health probes (`/actuator/health`), Nginx reverse proxy, rollback (`systemctl restart`).
**Proof:** `day8/k8s/`, `day8/proofs/`, `day8/day8-report.md`

---

## Day 9 — Load Balancing, HA & Monitoring
**Kya Seekha:** Nginx as load balancer, Prometheus, Grafana, Alertmanager.
**Kya Kiya:**
- **Load Balancer:** Nginx upstream mein 2 instances (`8080`, `8081`) add kiye. 10 requests test kiye.
- **Failover:** Instance 1 band kiya, Instance 2 se zero downtime response.
- **Prometheus:** Install kiya (Docker). Targets: `192.168.29.141:8080` aur `:8081`. Metrics scrape kiye (`http_server_requests_seconds_count`).
- **Grafana:** Install kiya (Docker). Prometheus data source add kiya. Dashboard banaya: `Books API Monitoring`.
- **Alert:** `BooksApiDown` alert rule (`up{job="books-api"} == 0`). Failover drill mein alert **fired** hua.
**Proof:** `day9/prometheus/`, `day9/docker-compose.yml`, `day9/proofs/`, `day9/day9-report.md`

---

## 📊 Overall Architecture
