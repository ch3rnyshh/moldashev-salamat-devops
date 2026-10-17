#!/bin/bash
# Student and system information script
# Author: Salamat Moldashev, IT2-2308, ID 37461

# Project root = parent folder of scripts/
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
INFO_FILE="$PROJECT_DIR/Moldashev_Salamat_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Salamat"
echo "Surname: Moldashev"
echo "Group: IT2-2308"
echo "Student ID: 37461"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " used of " $2}')"
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
