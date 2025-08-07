# 🚀 Quick Start Guide

Get up and running with Ubuntu OS Check in 5 minutes!

## ⚡ Super Quick Start

### 1. Clone or Download
```bash
git clone <repository-url>
cd ubuntu-os-check
```

### 2. Run Setup Script
```bash
chmod +x setup.sh
./setup.sh setup
```

### 3. Follow the Prompts
- Enter your server IP
- Enter your username
- Enter your password

### 4. Run the Check
```bash
./setup.sh run
```

**That's it! 🎉**

---

## 🔧 Manual Setup (Alternative)

### 1. Configure Your Server
Edit `inventory/hosts.ini`:
```ini
[ubuntu_servers]
myserver ansible_host=YOUR_SERVER_IP ansible_user=YOUR_USERNAME ansible_password=YOUR_PASSWORD
```

### 2. Test Connection
```bash
ansible ubuntu_servers -m ping
```

### 3. Run the Playbook
```bash
ansible-playbook ubuntu-os-check.yml
```

---

## 📋 What You'll See

```
========================================
UBUNTU OS CHECK SUMMARY
========================================
Hostname: myserver
Distribution: Ubuntu
Version: 22.04
Release: jammy
Architecture: x86_64
Kernel: 5.15.0-56-generic
========================================

Ubuntu version 22.04 is supported
```

---

## 🛠️ Troubleshooting

### Connection Issues?
```bash
# Test SSH manually
ssh username@server_ip

# Test with verbose output
ansible-playbook ubuntu-os-check.yml -vvv
```

### Permission Issues?
```bash
# Fix permissions
chmod 755 /path/to/project
chmod 644 /path/to/project/ansible.cfg
chmod 644 /path/to/project/inventory/hosts.ini
```

---

## 🎯 Next Steps

- Check out `examples/` for more configurations
- Read `README.md` for detailed documentation
- Customize the playbook for your needs

---

**Need help? Check the main README.md or examples directory! 📚** 