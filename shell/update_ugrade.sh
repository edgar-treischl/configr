#!/bin/bash

# This script updates and upgrades an Ubuntu/Debian-based system.

set -e  # Exit on error
set -o pipefail

echo "🔄 Updating package list..."
sudo apt update

echo "⬆️ Upgrading installed packages..."
sudo apt upgrade -y

echo "🧹 Removing unnecessary packages..."
sudo apt autoremove -y

echo "🧼 Cleaning up package cache..."
sudo apt clean

echo "✅ System update and upgrade completed successfully."
