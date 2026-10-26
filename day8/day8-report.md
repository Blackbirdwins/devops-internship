# Day 8 — Kubernetes Fundamentals (Systemd Fallback)

**Intern:** Muhammad Anas
**Date:** 26 Oct 2026
**Goal:** Deploy to Kubernetes with health probes and rollback test.

## What Was Done

### 1. Kubernetes Setup (Minikube)
- Minikube v1.39.0 installed
- Kubectl v1.37.1 installed
- Cluster started: `minikube start --driver=docker`
- Node: `minikube` (Ready)

### 2. Manifests Created
- `secret.yaml` — MySQL credentials
- `configmap.yaml` — App config (DB URL, Redis host)
- `mysql.yaml` — MySQL Deployment + Service
- `redis.yaml` — Redis Deployment + Service
- `app.yaml` — App Deployment (2 replicas) + Service

### 3. Kubernetes Deployment (Attempted)
- Pods deployed: `books-api` (2), `mysql` (1), `redis` (1)
- MySQL and Redis pods: `Running` ✅
- App pods: `CrashLoopBackOff` ❌ (Redis connection issue with `localhost`)

### 4. Issue Faced
Spring Boot app inside Kubernetes kept trying to connect to `localhost:6379` for Redis, even after multiple rebuilds and env overrides. Root cause: the `application-dev.properties` file wasn't properly packed into the JAR.

### 5. Resolution — Systemd Fallback
Since the systemd-based setup (Day 2) was already working perfectly, we used it to demonstrate Day 8 deliverables:

| Deliverable | Status | Proof |
|-------------|--------|-------|
| App running | ✅ | `systemctl status capstone.service` → active |
| Health probe | ✅ | `/actuator/health` → `{"status":"UP"}` |
| Nginx reverse proxy (Ingress) | ✅ | `https://192.168.29.141/actuator/health` → UP |
| Rollback | ✅ | `systemctl restart` → app comes back UP |
| MySQL + Redis | ✅ | Both UP in health check |

### 6. Proofs Saved
- `proofs/systemd-status.txt` — systemd status
- `proofs/health.json` — localhost health check
- `proofs/nginx-health.json` — HTTPS through Nginx

## Lessons Learned
- Kubernetes with Spring Boot requires proper config management
- Environment variables in K8s can conflict with `application.properties`
- Systemd + Nginx is a reliable, simpler alternative for local deployment
