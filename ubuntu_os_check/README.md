# Ubuntu OS Check - Ansible Playbook

A simple, flexible, and production-ready Ansible playbook to check Ubuntu operating system information on remote servers.

## 🎯 What This Does

This playbook automatically checks and reports:
- ✅ Ubuntu distribution and version
- ✅ System architecture and kernel
- ✅ Version compatibility validation
- ✅ Structured system information output

## 📋 Prerequisites

- Ansible 2.9 or higher
- SSH access to target Ubuntu server
- Python 3 on target server

## 🚀 Quick Start

### 1. Configure Your Server
Edit `inventory/hosts.ini` with your server details:
```ini
[ubuntu_servers]
your-server ansible_host=YOUR_SERVER_IP ansible_user=YOUR_USERNAME ansible_password=YOUR_PASSWORD
```

### 2. Run the Playbook
```bash
ansible-playbook ubuntu-os-check.yml
```

### 3. View Results
The playbook will show detailed Ubuntu system information and validation results.

## 📁 Project Structure

```
ubuntu-os-check/
├── README.md                    # This file
├── QUICK_START.md              # Quick start guide
├── ubuntu-os-check.yml         # Main playbook
├── setup.sh                    # Interactive setup script
├── ansible.cfg                 # Ansible configuration
├── inventory/
│   └── hosts.ini               # Server configuration
├── group_vars/
│   └── all.yml                 # Global settings
├── host_vars/
│   └── target-server.yml       # Server-specific settings
├── roles/
│   └── os_check/
│       ├── tasks/
│       │   ├── main.yml        # Main tasks
│       │   └── ubuntu_check.yml # Ubuntu-specific checks
│       ├── vars/
│       │   └── main.yml        # Role variables
│       ├── defaults/
│       │   └── main.yml        # Default settings
│       └── meta/
│           └── main.yml        # Role metadata
└── examples/                   # Practical examples
    └── README.md              # Usage examples
```

## ⚙️ Configuration

### Server Configuration (`inventory/hosts.ini`)
```ini
[ubuntu_servers]
# Single server
server1 ansible_host=192.168.1.100 ansible_user=ubuntu ansible_password=mypassword

# Multiple servers
server2 ansible_host=192.168.1.101 ansible_user=admin ansible_password=adminpass
server3 ansible_host=192.168.1.102 ansible_user=root ansible_password=rootpass
```

### Supported Ubuntu Versions (`group_vars/all.yml`)
```yaml
supported_ubuntu_versions:
  - "20.04"    # Ubuntu 20.04 LTS
  - "22.04"    # Ubuntu 22.04 LTS
  - "24.04"    # Ubuntu 24.04 LTS
```

## 🎮 Usage Examples

### Basic Usage
```bash
# Run against all servers
ansible-playbook ubuntu-os-check.yml

# Run with verbose output
ansible-playbook ubuntu-os-check.yml -v

# Run with debug output
ansible-playbook ubuntu-os-check.yml -vvv
```

### Selective Execution
```bash
# Run only validation tasks
ansible-playbook ubuntu-os-check.yml --tags validation

# Run only summary tasks
ansible-playbook ubuntu-os-check.yml --tags summary

# Skip debug output
ansible-playbook ubuntu-os-check.yml --skip-tags debug
```

### Target Specific Servers
```bash
# Run against specific server
ansible-playbook ubuntu-os-check.yml --limit server1

# Run against specific group
ansible-playbook ubuntu-os-check.yml --limit ubuntu_servers
```

## 📊 Sample Output

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

## 🔧 Customization

### Add New Ubuntu Versions
Edit `group_vars/all.yml`:
```yaml
supported_ubuntu_versions:
  - "20.04"
  - "22.04"
  - "24.04"
  - "25.04"  # Add new version
```

### Modify Output Format
Edit `roles/os_check/tasks/ubuntu_check.yml` to change the output format.

### Add Custom Checks
Add new tasks in `roles/os_check/tasks/ubuntu_check.yml`.

## 🛠️ Troubleshooting

### Connection Issues
```bash
# Test SSH connection
ssh username@server_ip

# Test Ansible connection
ansible ubuntu_servers -m ping

# Check inventory
ansible-inventory --list
```

### Permission Issues
```bash
# Fix directory permissions
chmod 755 /path/to/project
chmod 644 /path/to/project/ansible.cfg
chmod 644 /path/to/project/inventory/hosts.ini
```

### Common Errors
- **"No route to host"**: Check server IP and network connectivity
- **"Permission denied"**: Verify username and password
- **"World writable directory"**: Fix directory permissions

## 📝 Examples

### Example 1: Single Server Check
```bash
# Configure inventory
echo "[ubuntu_servers]" > inventory/hosts.ini
echo "myserver ansible_host=192.168.1.100 ansible_user=ubuntu ansible_password=mypass" >> inventory/hosts.ini

# Run check
ansible-playbook ubuntu-os-check.yml
```

### Example 2: Multiple Servers
```bash
# Configure multiple servers
cat > inventory/hosts.ini << EOF
[ubuntu_servers]
web1 ansible_host=192.168.1.10 ansible_user=webuser ansible_password=webpass
db1 ansible_host=192.168.1.11 ansible_user=dbuser ansible_password=dbpass
app1 ansible_host=192.168.1.12 ansible_user=appuser ansible_password=apppass
EOF

# Run check on all servers
ansible-playbook ubuntu-os-check.yml
```

### Example 3: Using SSH Keys
```bash
# Configure with SSH key
cat > inventory/hosts.ini << EOF
[ubuntu_servers]
myserver ansible_host=192.168.1.100 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF

# Run check
ansible-playbook ubuntu-os-check.yml
```

## 🔒 Security Notes

- Passwords are stored in plain text (for development only)
- For production, use SSH keys or Ansible Vault
- Consider using environment variables for sensitive data

## 📚 Best Practices

- ✅ Use SSH keys instead of passwords in production
- ✅ Use Ansible Vault for encrypted credentials
- ✅ Test on a single server before running on multiple servers
- ✅ Use tags for selective execution
- ✅ Keep inventory files secure and version-controlled

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is provided as-is for educational and production use.

## 🆘 Support

If you encounter issues:
1. Check the troubleshooting section
2. Verify your configuration
3. Test SSH connection manually
4. Use verbose output for debugging

---

**Happy Ubuntu checking! 🐧** 