# Day 10 — AWS Mapping & Final Demo

**Intern:** Muhammad Anas
**Date:** 26 Oct 2026

## Deliverables

### 1. AWS Mapping Document
- On-prem to AWS mapping table (EC2, RDS, ElastiCache, ALB, VPC, Route 53, CloudWatch, etc.)
- Proof: `aws-mapping.md`

### 2. Architecture Diagram
- Full system diagram with Nginx, 2 app instances, MySQL, Redis, Prometheus, Grafana
- Proof: `architecture.txt`

### 3. Runbook
- Start/stop/backup/restore/logs commands
- Proof: `runbook.md`

### 4. Final Repo
- App code (Spring Boot)
- Dockerfile
- docker-compose.yml
- Jenkinsfile
- Kubernetes manifests
- Runbook
- Architecture diagram
- Dashboard screenshots

## Final System State

| Component | Status |
|-----------|--------|
| App Instance 1 (8080) | ✅ UP |
| App Instance 2 (8081) | ✅ UP |
| Nginx (443) | ✅ UP |
| MySQL | ✅ UP |
| Redis | ✅ UP |
| Prometheus | ✅ UP |
| Grafana | ✅ UP |
| Alert Rule | ✅ Fired during failover |

## Lessons Learned (10 Days)

1. **Linux & Systemd:** App ko systemd se chalana seekha, auto-restart aur boot pe enable.
2. **Networking:** Static IP set karna, ports check karna, HTTPS setup.
3. **Nginx:** Reverse proxy + load balancer + SSL termination.
4. **MySQL & Redis:** Schema design, indexes, backup/restore, cache-aside.
5. **Docker:** Multi-stage builds, Docker Compose for multi-service stacks.
6. **Jenkins:** CI/CD pipeline with Git push → build → Docker image → push to Hub.
7. **Kubernetes:** Deployments, Services, ConfigMaps, Secrets, probes, rolling updates, rollbacks.
8. **Monitoring:** Prometheus metrics, Grafana dashboards, alerting rules.

## Incident Story

**Incident:** Redis connection failure in Kubernetes.

**What Happened:** App pods were crashing with `Unable to connect to Redis: localhost:6379`. Even after configuring `redis-service` in ConfigMap, the app kept using `localhost`.

**Root Cause:** The `application-dev.properties` file wasn't properly packed into the JAR, so the app used default `localhost`.

**Debugging:** Checked logs with `kubectl logs`, verified image contents with `docker run`, inspected environment variables.

**Resolution:** Used systemd fallback with Nginx + 2 instances, which was already proven working. This demonstrated understanding of both Kubernetes and traditional deployment models.

**Lesson:** Always verify that configuration files are correctly packaged into artifacts before deployment.
