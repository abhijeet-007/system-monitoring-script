#!/bin/bash
#Disk Usage monitor code

#DISK USAGE CODE
echo ""
DISK_THRESHOLD=15

echo "Checking disk usage..."
DISK_USAGE=$(df -h | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Current disk usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        echo "WARNING: DISK usage exceeded: ($DISK_USAGE%)"
else
        echo "Disk usage is under control"
fi
echo ""


#MEMORY MONITOR USAGE CODE

MEMORY_THRESHOLD=10

echo "Checking memory usage..."
MEMORY_USAGE=$(free | awk 'NR==2 {printf("%.0f"), $3/$2 * 100}')
echo "Current memory usage: $MEMORY_USAGE"
if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
	echo "WARNING: MEMORY usage exceeded threshold: $MEMORY_USAGE"
else
	echo "Memory usage is under control"
fi
echo ""

