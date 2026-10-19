# Day 3 — Incident Note

**Intern:** Muhammad Anas
**Date:** 16 Oct 2026

## Health Check Results

### 1. Internet Connectivity
- **Command:** `ping -c 2 8.8.8.8`
- **Result:** ✅ Working

### 2. DNS Resolution
- **Command:** `dig google.com +short`
- **Result:** ✅ Working (IP resolved)

### 3. Capstone Service
- **Command:** `sudo systemctl status capstone.service`
- **Result:** ✅ Active (running)
- **PID:** 18278 (http-server)

### 4. Port Binding
- **Command:** `ss -tuln | grep 8000`
- **Result:** ✅ Listening on 0.0.0.0:8000

### 5. HTTP Response (Local)
- **Command:** `curl -I http://localhost:8000`
- **Result:** ✅ HTTP/1.1 200 OK
- **Headers:** `cache-control: no-cache, no-store, must-revalidate`

### 6. Network Interface
- **Command:** `ip a | grep "inet "`
- **WiFi IP:** 192.168.29.141
- **Interface:** wlp0s20f3

### 7. Cross-Device Access
- **Test:** iPhone pe `http://192.168.29.141:8000`
- **Result:** ⚠️ Blank page / ping fail
- **Root Cause:** Router AP Isolation likely ON
- **Workaround:** Ngrok temporary exposure

## Conclusion
Capstone locally fully operational hai. Cross-device access mein router-level issue hai.
