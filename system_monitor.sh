#!/bin/bash
#Disk Usage monitor code



DISK_THRESHOLD=80

echo "Checking disk usage..."

DISK_USAGE=$(df -h | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Current disk usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        echo "WARNING: DISK usage exceed: ($DISK_USAGE%)"
else
        echo "Disk usage is under control"
fi
