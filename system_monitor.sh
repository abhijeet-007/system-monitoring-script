#!/bin/bash
#Disk and Memory Usage monitor code

# Color Codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'




#DISK USAGE CODE

echo -e "${BLUE}==============================${NC}"
echo -e "${BLUE}   System Monitoring Report   ${NC}"
echo -e "${BLUE}==============================${NC}"
echo "Date: $(date)"
echo ""

DISK_THRESHOLD=70

echo -e ${BLUE}"Disk Usage Monitoring${NC}"
echo "------------------------------"

echo -e ${YELLOW}"Checking disk usage...${NC}"
DISK_USAGE=$(df -h | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Current disk usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
        echo -e ${RED}"WARNING: DISK usage exceeded: ($DISK_USAGE%)${NC}"
else
        echo -e ${GREEN}"Disk usage is under control${NC}"
fi
echo ""


#MEMORY MONITOR USAGE CODE

MEMORY_THRESHOLD=15

echo -e ${BLUE}"Memory Usage Monitoring${NC}"
echo "------------------------------"

echo -e ${YELLOW}"Checking memory usage...${NC}"
MEMORY_USAGE=$(free | awk 'NR==2 {printf("%.0f"), $3/$2 * 100}')
echo "Current memory usage: $MEMORY_USAGE"
if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
	echo -e ${RED}"WARNING: MEMORY usage exceeded threshold: $MEMORY_USAGE${NC}"
else
	echo -e ${GREEN}"Memory usage is under control${NC}"
fi
echo ""

echo -e ${BLUE}"Top CPU & Memory Processes${NC}"
echo "------------------------------"

echo -e ${YELLOW}"Top 5 CPU Consuming Processes:${NC}"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

echo ""
echo -e ${YELLOW}"Top 5 Memory Consuming Processes:${NC}"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6


echo ""
echo -e ${GREEN}"Monitoring Completed.${NC}"
echo ""





