# Ansible Automation Repository

[![Ansible](https://img.shields.io/badge/Ansible-Automation-blue?logo=ansible)](https://www.ansible.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📦 Overview

This repository contains a collection of Ansible playbooks and roles for automating system administration tasks, with a focus on Ubuntu OS checks and reusable playbooks for Linux and Windows environments.

- **`ubuntu_os_check/`**: Production-ready Ansible role and playbooks for checking Ubuntu OS details, compatibility, and system information.
- **`test-playbooks/`**: A set of example playbooks for various Linux and Windows automation tasks.

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd Ansible
   ```
2. **Install Ansible:**
   ```bash
   pip install ansible
   # or use your OS package manager
   ```
3. **Configure your inventory:**
   - Edit `ubuntu_os_check/inventory/hosts.ini` with your server details.

4. **Run a playbook:**
   - For Ubuntu OS check:
     ```bash
     cd ubuntu_os_check
     ansible-playbook ubuntu-os-check.yml
     ```
   - For other examples:
     ```bash
     cd ../test-playbooks
     ansible-playbook <playbook-name>.yml
     ```

## 📁 Repository Structure

```
Ansible/
├── ubuntu_os_check/      # Ubuntu OS check role, playbooks, and docs
├── test-playbooks/       # Example playbooks for Linux/Windows
├── README.md             # (This file)
```

## 🤝 Contributing

Contributions are welcome! Please fork the repo, create a feature branch, and submit a pull request.

## 📄 License

This project is licensed under the MIT License.
