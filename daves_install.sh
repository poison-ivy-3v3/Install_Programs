#!/bin/bash

echo "Starting the installation script..."

# Update and Upgrade
echo "Updating package lists..."
sudo apt-get update
echo "Upgrading installed packages..."
sudo apt-get upgrade -y

# Install from repository
echo "Installing Aircrack-NG, Bettercap, MDK4, Wireshark, DB Browser for SQLite, GPSD, Wireguard, NMAP, traceroute, Kismet, GQRX, hostapd, hping3..."
sudo apt-get install -y aircrack-ng bettercap mdk4 wireshark sqlitebrowser gpsd wireguard nmap traceroute kismet gqrx-sdr hostapd hping3

# Install Metasploit
echo "Installing Metasploit..."
cd /tmp
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
sudo ./msfinstall

# Install GNU Radio Companion
echo "Installing GNU Radio Companion..."
sudo apt-get install -y gnuradio

# Install GPS Prune
echo "Installing GPS Prune..."
sudo apt-get install -y gpsprune

# Setting up Wireshark for non-root user
echo "Configuring Wireshark for non-root users..."
sudo dpkg-reconfigure wireshark-common
sudo usermod -a -G wireshark $USER

# Cleaning up
echo "Cleaning up..."
sudo apt-get clean

echo "All requested programs have been installed. Please reboot your system for all changes to take effect."
