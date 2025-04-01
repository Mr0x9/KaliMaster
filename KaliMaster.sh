#!/bin/bash

# KaliMaster - Kali Linux Management Toolset
# Author: 0x9
# Version: 1.0
# Description: A simple toolset to automate Kali Linux setup and maintenance.

GREEN="\033[0;32m"
RED="\033[1;31m"
RESET="\033[0m"

ASCII_ART="
  K    K  AAAAA   L      III   M    M  AAAAA  SSSSS  TTTTT  EEEEE  RRRRR
  K   K   A   A   L       I    MM  MM  A   A  S        T    E      R   R
  KKKK    AAAAA   L       I    M MM M  AAAAA  SSSSS    T    EEEE   RRRRR
  K   K   A   A   L       I    M    M  A   A      S    T    E      R R
  K    K  A   A   LLLLL  III   M    M  A   A  SSSSS    T    EEEEE  R  RR   0x9
"

# Log file location
LOG_FILE="/var/log/kali_master_tool.log"

# Function to log output to both console and log file
log_message() {
    local message="$1"
    echo -e "$message"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOG_FILE"
}

# Function to check if the script is run as root
check_for_root() {
    if [ "$(id -u)" -ne 0 ]; then
        log_message "${RED}[!] You must run this script as root.${RESET}"
        exit 1
    fi
}

# Function to display the main menu
kali_master_menu() {
    while true; do
        clear
        # Display ASCII Art and Menu Header
        echo -e "$ASCII_ART"
        log_message "Displaying KaliMaster Menu"
        echo -e "\n    KaliMaster: Kali Linux Management Toolset"
        echo -e "    Version 1.0 - A simple toolset to automate Kali Linux setup and maintenance"
        echo -e "\n    Choose an option from the menu:             Rev: $(uname -r)"
        echo -e "--------------------------------------------------------------------------------------"
        echo -e " Key  Menu Option:                 Description:"
        echo -e " ---  ------------                 ---------------------------------------------------"
        echo -e " 1    Fix Missing Packages         Installs pip, nmap, build-essential, etc."
        echo -e " 2    Reinstall Impacket           Installs Impacket scripts"
        echo -e " 3    Enable Root Login            Enables Kali root login"
        echo -e " 4    Full System Upgrade          Upgrades Kali system packages"
        echo -e " 5    Set up Kali Root and Tools   Installs network tools like linpeas"
        echo -e " 6    Network Tools Setup          Installs network tools"
        echo -e " D    Install Useful Dev Tools     Installs VSCode, Sublime Text, etc."
        echo -e " N    Fresh Install                Installs essential packages and penetration testing tools"
        echo -e " E    Exit                         Exits the script"
        echo -e "--------------------------------------------------------------------------------------"
        
        read -n1 -p "Select an option: " menuinput
        case $menuinput in
            1) fix_missing_packages ;;
            2) reinstall_impacket ;;
            3) enable_root_login ;;
            4) full_system_upgrade ;;
            5) setup_kali_root_tools ;;
            6) network_tools_setup ;;
            D) install_dev_tools ;;
            N) fresh_install ;;
            E|e) log_message "Exiting script."; exit 0 ;;
            *) log_message "${RED}[!] Invalid selection. Please try again.${RESET}" ;;
        esac
    done
}

# Function to fix missing packages
fix_missing_packages() {
    log_message "${GREEN}[+] Fixing missing packages...${RESET}"
    apt update && apt install -y pip pip3 nmap build-essential curl wget git || {
        log_message "${RED}[!] Failed to install missing packages.${RESET}"
        return 1
    }
    log_message "${GREEN}[+] Missing packages fixed successfully.${RESET}"
}

# Function to reinstall Impacket
reinstall_impacket() {
    log_message "${GREEN}[+] Reinstalling Impacket...${RESET}"
    apt install -y impacket-scripts || {
        log_message "${RED}[!] Failed to install Impacket scripts.${RESET}"
        return 1
    }
    log_message "${GREEN}[+] Impacket scripts installed successfully.${RESET}"
}

# Function to enable root login
enable_root_login() {
    log_message "${GREEN}[+] Enabling root login...${RESET}"
    read -p "Are you sure you want to enable root login? This can expose your system to potential attacks! (y/n): " confirm
    if [[ "$confirm" != "y" ]]; then
        log_message "${RED}[!] Root login enabling aborted.${RESET}"
        return
    fi
    sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
    systemctl restart ssh
    log_message "${GREEN}[+] Root login enabled successfully.${RESET}"
}

# Function for full system upgrade
full_system_upgrade() {
    log_message "${GREEN}[+] Upgrading the system...${RESET}"
    read -p "Are you sure you want to upgrade the system? This may require a reboot. (y/n): " confirm
    if [[ "$confirm" != "y" ]]; then
        log_message "${RED}[!] System upgrade aborted.${RESET}"
        return
    fi
    apt update && apt upgrade -y || {
        log_message "${RED}[!] Failed to upgrade system packages.${RESET}"
        return 1
    }
    log_message "${GREEN}[+] System upgrade completed successfully.${RESET}"
}

# Function to set up Kali root tools (Network tools, linpeas, etc)
setup_kali_root_tools() {
    log_message "${GREEN}[+] Setting up Kali root tools...${RESET}"
    apt install -y linpeas crackmapexec netexec || {
        log_message "${RED}[!] Failed to install Kali root tools.${RESET}"
        return 1
    }
    log_message "${GREEN}[+] Kali root tools set up successfully.${RESET}"
}

# Function to install development tools (VSCode, Sublime, etc)
install_dev_tools() {
    log_message "${GREEN}[+] Installing development tools...${RESET}"
    apt install -y vscode sublime-text gedit flameshot || {
        log_message "${RED}[!] Failed to install development tools.${RESET}"
        return 1
    }
    log_message "${GREEN}[+] Development tools installed successfully.${RESET}"
}

# Function to perform a fresh install of essential tools and penetration testing tools
fresh_install() {
    log_message "${GREEN}[+] Starting fresh install...${RESET}"
    
    # Install basic packages
    apt update && apt install -y pip pip3 nmap build-essential curl wget git || {
        log_message "${RED}[!] Failed to install basic packages.${RESET}"
        return 1
    }

    # Install penetration testing and hacking tools
    log_message "${GREEN}[+] Installing penetration testing tools...${RESET}"
    apt install -y metasploit-framework hydra john burpsuite wireshark netcat aircrack-ng gobuster dnsrecon || {
        log_message "${RED}[!] Failed to install penetration testing tools.${RESET}"
        return 1
    }
    
    log_message "${GREEN}[+] Fresh install completed successfully with tools: metasploit, hydra, john, burpsuite, wireshark, and more.${RESET}"
}

# Main entry point
main() {
    check_for_root
    kali_master_menu
}

# Execute the main function
main
