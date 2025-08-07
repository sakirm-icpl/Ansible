#!/bin/bash

echo "🐧 Ubuntu OS Check - Setup Script"
echo "================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}$1${NC}"
}

# Check if Ansible is installed
check_ansible() {
    print_status "Checking Ansible installation..."
    if command -v ansible &> /dev/null; then
        ansible_version=$(ansible --version | head -n1)
        print_status "Ansible found: $ansible_version"
    else
        print_error "Ansible is not installed. Please install Ansible first."
        echo "Installation guide: https://docs.ansible.com/ansible/latest/installation_guide/"
        exit 1
    fi
}

# Create inventory template
create_inventory_template() {
    print_status "Creating inventory template..."
    
    cat > inventory/hosts.ini << 'EOF'
# Ubuntu OS Check - Inventory Configuration
# Replace the values below with your server details

[ubuntu_servers]
# Example: Single server
# myserver ansible_host=192.168.1.100 ansible_user=ubuntu ansible_password=mypassword

# Example: Multiple servers
# web1 ansible_host=192.168.1.10 ansible_user=webuser ansible_password=webpass
# db1 ansible_host=192.168.1.11 ansible_user=dbuser ansible_password=dbpass
# app1 ansible_host=192.168.1.12 ansible_user=appuser ansible_password=apppass

# Example: Using SSH keys (recommended for production)
# myserver ansible_host=192.168.1.100 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF

    print_status "Inventory template created at inventory/hosts.ini"
}

# Interactive setup
interactive_setup() {
    print_header "\n🔧 Interactive Setup"
    echo "Let's configure your server details:"
    echo ""
    
    read -p "Enter server IP address: " server_ip
    read -p "Enter username: " username
    read -p "Enter password: " password
    
    # Create inventory with user input
    cat > inventory/hosts.ini << EOF
[ubuntu_servers]
myserver ansible_host=$server_ip ansible_user=$username ansible_password=$password
EOF
    
    print_status "Inventory configured with your server details"
}

# Test connection
test_connection() {
    print_header "\n🔗 Testing Connection"
    
    if [ -f "inventory/hosts.ini" ]; then
        print_status "Testing Ansible connection..."
        if ansible -i inventory/hosts.ini ubuntu_servers -m ping; then
            print_status "✅ Connection successful!"
            return 0
        else
            print_error "❌ Connection failed. Please check your server details."
            return 1
        fi
    else
        print_error "Inventory file not found. Please run setup first."
        return 1
    fi
}

# Run the playbook
run_playbook() {
    print_header "\n🚀 Running Ubuntu OS Check"
    
    if [ -f "inventory/hosts.ini" ]; then
        print_status "Executing playbook..."
        ansible-playbook -i inventory/hosts.ini ubuntu-os-check.yml
    else
        print_error "Inventory file not found. Please run setup first."
        exit 1
    fi
}

# Show usage
show_usage() {
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  setup     - Interactive setup (configure server details)"
    echo "  template  - Create inventory template"
    echo "  test      - Test connection to configured servers"
    echo "  run       - Run the Ubuntu OS check playbook"
    echo "  all       - Setup, test, and run (complete workflow)"
    echo "  help      - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 setup     # Configure your server details"
    echo "  $0 test      # Test connection"
    echo "  $0 run       # Run the playbook"
    echo "  $0 all       # Complete setup and run"
}

# Main script logic
case "${1:-help}" in
    "setup")
        check_ansible
        interactive_setup
        ;;
    "template")
        check_ansible
        create_inventory_template
        ;;
    "test")
        check_ansible
        test_connection
        ;;
    "run")
        check_ansible
        run_playbook
        ;;
    "all")
        check_ansible
        interactive_setup
        if test_connection; then
            run_playbook
        else
            print_error "Setup incomplete due to connection failure."
            exit 1
        fi
        ;;
    "help"|*)
        show_usage
        ;;
esac 