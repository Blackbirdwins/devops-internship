# Day 1 — Linux Fundamentals Cheat Sheet

**Intern:** Muhammad Anas
**Date:** 15 Oct 2025
**Location:** /home/anas/Documents/Devops/day1drill

---

## 🧭 Navigation

| Command | Kaam | Example |
|---------|------|---------|
| `pwd` | Current directory | `pwd` → /home/anas |
| `cd ~` | Home pe jao | `cd ~` |
| `cd /etc` | Specific path | `cd /etc` |
| `cd ..` | Ek upar | `cd ..` |
| `cd -` | Pichli directory | `cd -` |
| `ls -la` | Sab files detailed | `ls -la` |

---

## 📁 File Operations

| Command | Kaam | Example |
|---------|------|---------|
| `mkdir -p path` | Nested folders | `mkdir -p a/b/c` |
| `touch file` | Empty file | `touch note.txt` |
| `echo "text" > file` | Content likho | `echo "hi" > a.txt` |
| `cat file` | Padho | `cat note.txt` |
| `cp src dest` | Copy | `cp a.txt b.txt` |
| `mv old new` | Move/Rename | `mv a.txt b.txt` |
| `rm file` | Delete | `rm a.txt` |
| `rm -rf folder` | Force delete | `rm -rf test/` |

---

## 🔍 Search

| Command | Kaam | Example |
|---------|------|---------|
| `find path -name "*.txt"` | File dhoondo | `find . -name "*.txt"` |
| `grep "text" file` | Text dhoondo | `grep "error" log.txt` |
| `grep -i` | Case-insensitive | `grep -i "Error" log.txt` |
| `grep -n` | Line numbers | `grep -n "root" file` |
| `grep -r` | Recursive | `grep -r "text" folder/` |
| `tail file` | Last 10 lines | `tail log.txt` |
| `tail -f file` | Follow live | `tail -f log.txt` |
| `head file` | First 10 lines | `head log.txt` |

---

## 📊 System Info

| Command | Kaam | Example |
|---------|------|---------|
| `uname -a` | Kernel + OS | `uname -a` |
| `uptime` | Uptime + load | `uptime` |
| `free -h` | RAM usage | `free -h` |
| `df -h` | Disk usage | `df -h` |
| `du -sh folder` | Folder size | `du -sh ~/Documents` |
| `ps aux` | All processes | `ps aux` |
| `top` | Live monitor | `top` (q to quit) |
| `htop` | Better top | `htop` |

---

## 👥 Users & Permissions

| Command | Kaam | Example |
|---------|------|---------|
| `whoami` | Current user | `whoami` |
| `id` | User + groups | `id` |
| `groups` | User ke groups | `groups` |
| `chmod 755 file` | Permission set | `chmod 755 script.sh` |
| `chmod +x file` | Executable banao | `chmod +x script.sh` |
| `chown user:group file` | Owner change | `sudo chown deploy:deploy a.txt` |
| `sudo cmd` | Admin command | `sudo apt update` |

### chmod Numbers (Yaad karo!)
r (read) = 4
w (write) = 2
x (execute) = 1

755 = rwxr-xr-x → Common scripts
644 = rw-r--r-- → Common files
600 = rw------- → Private files
777 = rwxrwxrwx → ⚠️ Insecure (avoid!)


---

## 📦 Package Management (Ubuntu)

| Command | Kaam |
|---------|------|
| `sudo apt update` | Package list update |
| `sudo apt upgrade -y` | Installed packages upgrade |
| `sudo apt install pkg` | New package install |
| `sudo apt remove pkg` | Package remove |
| `apt search pkg` | Package dhoondo |

---

## 📋 Logs

| Command | Kaam |
|---------|------|
| `sudo tail /var/log/syslog` | System log |
| `sudo tail /var/log/auth.log` | Auth log |
| `sudo grep -i "error" /var/log/syslog` | Errors dhoondo |
| `tail -f /var/log/syslog` | Live follow |

---

## ⚠️ Common Space Mistakes

| ❌ Galat | ✅ Sahi |
|---------|---------|
| `tail/etc/passwd` | `tail /etc/passwd` |
| `find /etc -name"*.conf"` | `find /etc -name "*.conf"` |
| `cp file1file2` | `cp file1 file2` |
| `ls-la` | `ls -la` |

**Rule:** Command aur argument ke darmiyan **space zaroori**.

---

## 🎯 Tab Completion (Pro Tip)

- `tail /et` + `Tab` → `/etc/`
- `/etc/pass` + `Tab` → `/etc/passwd`
- Type less, save time, avoid mistakes

---

**Status:** ✅ Day 1 Complete
