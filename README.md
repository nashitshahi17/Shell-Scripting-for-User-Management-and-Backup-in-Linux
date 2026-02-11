# ⚙️ Linux Automation Project  
### User Management + Backup System (Professional Bash Implementation)

This project contains two production-style Bash automation tools used to manage Linux system users and create secure timestamped backups.  
Both scripts follow professional standards such as validation, logging, modularity, and root-level safety checks.

---

# 🚀 Features Overview

## 🔹 1. User Management Script (`user_management.sh`)
A fully interactive and validated user/group management tool.

### Features:
- Create user
- Create group
- Add user to group
- Validates existing users/groups
- Optional shell selection
- Logging for every operation
- Root permission enforcement
- Safe error handling
- Professional color-coded CLI menu

---

## 🔹 2. Backup Script (`backup.sh`)
A secure, timestamped backup automation tool.

### Features:
- Validates source directory
- Creates compressed `.tar.gz` backups 
- Timestamped filename format: 
  `backup-YYYY-MM-DD-HH-MM-SS.tar.gz`
- Stores all backups in `/backups/` 
- Dedicated logging (`backup.log`) 
- Full error handling (invalid directories, permission issues)
- Automatic folder creation
- No accidental file overwriting

---

# 🛠️ Installation & Running the Scripts

### 1️⃣ Make scripts executable:
chmod +x user_management.sh <br>
chmod +x backup.sh

### 2️⃣ Run with sudo:
sudo ./user_management.sh <br>
sudo ./backup.sh

---

# 📦 Example Backup Output

Example generated file:
backups/backup-2026-02-12-18-33-20.tar.gz


Example log entry:
2026-02-12 18:33:20 : Backup successful: /etc -> backups/backup-2026-02-12-18-33-20.tar.gz

---

# 🔐 Security & Reliability Features
- Must run as root (prevents permission issues)
- Input validation prevents script crashes
- Timestamp ensures unique backup names
- Logs every action for auditability
- Avoids overwriting existing files
- No hardcoded passwords or unsafe operations
- Safe `usermod -aG` usage (append mode)

---

# 📈 Why This Project Matters 
This project demonstrates:
- Automation capability 
- Linux system administration skills 
- Bash scripting 
- Error handling & validation 
- Logging 
- Secure system operations 
- Clean, modular code design 
- Real DevOps thinking 

It is far beyond a basic script — it simulates real administrative tooling used by sysadmins and DevOps engineers.

---

# 💡 Future Enhancements
- Add cron jobs for scheduled backups 
- Add delete-user & delete-group modules 
- Encrypt backup files 
- Add interactive dashboard using whiptail/dialog 
- Email notifications after backups 
- System monitoring add-on script 

---

# 🏁 Final Notes
This project represents not just scripting but **professional automation behavior**. 
