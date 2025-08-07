# Ubuntu OS Check - Examples

This directory contains practical examples for different use cases.

## 📁 Examples Structure

```
examples/
├── README.md              # This file
├── single-server/         # Single server configuration
├── multiple-servers/      # Multiple servers configuration
├── ssh-keys/             # SSH key authentication
├── production/           # Production-ready setup
└── docker/              # Docker container examples
```

## 🎯 Quick Examples

### Example 1: Single Server
```bash
# Copy single server example
cp examples/single-server/hosts.ini inventory/hosts.ini

# Edit with your server details
nano inventory/hosts.ini

# Run the check
ansible-playbook ubuntu-os-check.yml
```

### Example 2: Multiple Servers
```bash
# Copy multiple servers example
cp examples/multiple-servers/hosts.ini inventory/hosts.ini

# Edit with your server details
nano inventory/hosts.ini

# Run the check
ansible-playbook ubuntu-os-check.yml
```

### Example 3: SSH Keys (Recommended)
```bash
# Copy SSH key example
cp examples/ssh-keys/hosts.ini inventory/hosts.ini

# Edit with your server details
nano inventory/hosts.ini

# Run the check
ansible-playbook ubuntu-os-check.yml
```

## 🔧 Configuration Examples

### Single Server (`examples/single-server/hosts.ini`)
```ini
[ubuntu_servers]
myserver ansible_host=192.168.1.100 ansible_user=ubuntu ansible_password=mypassword
```

### Multiple Servers (`examples/multiple-servers/hosts.ini`)
```ini
[ubuntu_servers]
web1 ansible_host=192.168.1.10 ansible_user=webuser ansible_password=webpass
db1 ansible_host=192.168.1.11 ansible_user=dbuser ansible_password=dbpass
app1 ansible_host=192.168.1.12 ansible_user=appuser ansible_password=apppass
```

### SSH Keys (`examples/ssh-keys/hosts.ini`)
```ini
[ubuntu_servers]
myserver ansible_host=192.168.1.100 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
```

### Production Setup (`examples/production/hosts.ini`)
```ini
[ubuntu_servers]
prod-web1 ansible_host=10.0.1.10 ansible_user=deploy ansible_ssh_private_key_file=~/.ssh/prod_key
prod-db1 ansible_host=10.0.1.11 ansible_user=deploy ansible_ssh_private_key_file=~/.ssh/prod_key
prod-app1 ansible_host=10.0.1.12 ansible_user=deploy ansible_ssh_private_key_file=~/.ssh/prod_key
```

## 🚀 Usage Examples

### Run Specific Examples
```bash
# Single server
ansible-playbook -i examples/single-server/hosts.ini ubuntu-os-check.yml

# Multiple servers
ansible-playbook -i examples/multiple-servers/hosts.ini ubuntu-os-check.yml

# SSH keys
ansible-playbook -i examples/ssh-keys/hosts.ini ubuntu-os-check.yml

# Production
ansible-playbook -i examples/production/hosts.ini ubuntu-os-check.yml
```

### Test Connections
```bash
# Test single server
ansible -i examples/single-server/hosts.ini ubuntu_servers -m ping

# Test multiple servers
ansible -i examples/multiple-servers/hosts.ini ubuntu_servers -m ping

# Test SSH key connection
ansible -i examples/ssh-keys/hosts.ini ubuntu_servers -m ping
```

## 📝 Customization Examples

### Add Custom Variables
```yaml
# examples/custom/group_vars/all.yml
supported_ubuntu_versions:
  - "20.04"
  - "22.04"
  - "24.04"
  - "25.04"  # Custom version

custom_checks:
  - check_disk_space: true
  - check_memory: true
  - check_services: true
```

### Custom Output Format
```yaml
# examples/custom/roles/os_check/tasks/custom_output.yml
- name: Custom System Report
  debug:
    msg: |
      ========================================
      CUSTOM SYSTEM REPORT
      ========================================
      Server: {{ ansible_hostname }}
      OS: {{ ansible_distribution }} {{ ansible_distribution_version }}
      Uptime: {{ ansible_uptime_seconds | int // 3600 }} hours
      Load Average: {{ ansible_loadavg.1m }}
      ========================================
```

## 🔒 Security Examples

### Using Ansible Vault
```bash
# Create encrypted inventory
ansible-vault create inventory/hosts.ini

# Edit encrypted inventory
ansible-vault edit inventory/hosts.ini

# Run with vault password
ansible-playbook -i inventory/hosts.ini ubuntu-os-check.yml --ask-vault-pass
```

### Environment Variables
```bash
# Set environment variables
export ANSIBLE_USER=ubuntu
export ANSIBLE_PASSWORD=mypassword

# Use in inventory
cat > inventory/hosts.ini << EOF
[ubuntu_servers]
myserver ansible_host=192.168.1.100 ansible_user=\${ANSIBLE_USER} ansible_password=\${ANSIBLE_PASSWORD}
EOF
```

## 🐳 Docker Examples

### Run in Docker Container
```bash
# Build Docker image
docker build -t ubuntu-os-check .

# Run with volume mount
docker run -v $(pwd):/ansible ubuntu-os-check ansible-playbook ubuntu-os-check.yml
```

### Docker Compose
```yaml
# examples/docker/docker-compose.yml
version: '3.8'
services:
  ansible:
    build: .
    volumes:
      - .:/ansible
    command: ansible-playbook ubuntu-os-check.yml
```

## 📊 Output Examples

### Standard Output
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
```

### JSON Output
```json
{
  "ubuntu_os_result": {
    "hostname": "myserver",
    "distribution": "Ubuntu",
    "version": "22.04",
    "release": "jammy",
    "architecture": "x86_64",
    "kernel": "5.15.0-56-generic",
    "is_supported": true
  }
}
```

## 🆘 Troubleshooting Examples

### Debug Connection Issues
```bash
# Test SSH manually
ssh username@server_ip

# Test with verbose output
ansible -i inventory/hosts.ini ubuntu_servers -m ping -vvv

# Check inventory parsing
ansible-inventory -i inventory/hosts.ini --list
```

### Fix Common Issues
```bash
# Fix permissions
chmod 755 /path/to/project
chmod 644 /path/to/project/ansible.cfg
chmod 644 /path/to/project/inventory/hosts.ini

# Test with explicit inventory
ansible-playbook -i inventory/hosts.ini ubuntu-os-check.yml
```

---

**Choose the example that best fits your needs and customize as required! 🎯** 