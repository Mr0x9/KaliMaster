# KaliMaster - Kali Linux Management Toolset

**KaliMaster** is a simple and efficient toolset designed to automate Kali Linux setup and maintenance tasks. This script simplifies the process of setting up and maintaining a Kali Linux environment by offering a variety of utilities that handle missing package installations, penetration testing tool setups, and system upgrades.

## Features

- **Fix Missing Packages**: Installs missing essential packages like `pip`, `nmap`, `build-essential`, etc.
- **Reinstall Impacket**: Reinstalls the Impacket scripts for penetration testing.
- **Enable Root Login**: Enables root login on Kali Linux (with a warning about security risks).
- **Full System Upgrade**: Upgrades Kali system packages to the latest versions.
- **Set up Kali Root and Tools**: Installs tools like `linpeas`, `crackmapexec`, and `netexec` for network penetration testing.
- **Network Tools Setup**: Installs essential network tools for penetration testing.
- **Development Tools**: Installs useful development tools like VSCode, Sublime Text, and Flameshot.
- **Fresh Install**: Installs essential packages and a wide range of penetration testing tools such as `Metasploit`, `Hydra`, `John the Ripper`, `Burp Suite`, `Wireshark`, `Gobuster`, and more.

## Installation

### Step 1: Download the Script

You can create a new script file on your Kali Linux machine and copy the content of the `kali_master.sh` script into it.

```bash
nano kali_master.sh
```
## Step 2: Make the Script Executable

```bash
chmod +x kali_master.sh
```
## Step 3: Run the Script as Root

You must run the script as root for it to perform system-level tasks like installing packages and modifying system configurations.

```bash
sudo ./kali_master.sh
```
## Step 4: Use the Menu

The script will display a menu with different options. Use the keyboard to select the desired task. Example options include:

Option 1: Fix Missing Packages

Option 2: Reinstall Impacket

Option 3: Enable Root Login

Option 4: Full System Upgrade

Option 5: Set up Kali Root and Tools

Option 6: Network Tools Setup

Option D: Install Useful Development Tools

Option N: Fresh Install (Install essential packages and pentesting tools)

Option E: Exit the script

## Available Tools (Fresh Install)
When selecting Fresh Install, the following penetration testing tools will be installed:

- Metasploit Framework

- Hydra

- John the Ripper

- Burp Suite

- Wireshark

- Gobuster

- Aircrack-ng

- Nmap

- dnsrecon

- dirb

- enum4linux

- msfvenom

- smbclient

These tools are essential for various penetration testing and security research tasks.

## Example Usage

Run Fresh Install

```bash
sudo ./kali_master.sh
```
After running the script, choose option N to perform a Fresh Install and install the penetration testing tools.

## Example Output

```bash
[+] Starting fresh install...
Hit:1 http://http.kali.org/kali kali-rolling InRelease
Reading package lists... Done
Building dependency tree       
Reading state information... Done
...
[+] Fresh install completed successfully with tools: metasploit, hydra, john, burpsuite, wireshark, gobuster, dirb, enum4linux, msfvenom, smbclient, and more.
```
## Prerequisites

- Kali Linux installed

- A stable internet connection for package installations

- Root privileges to install packages and modify configurations

## Contributing
Feel free to fork the repository, open issues, or contribute to the development of KaliMaster. Pull requests are welcome!

## License
This project is licensed under the MIT License - see the LICENSE file for details.




