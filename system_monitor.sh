#!/bin/bash
#Disk and Memory Usage monitor code

# Color Codes
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'


DISK_THRESHOLD=80
MEMORY_THRESHOLD=75


# Log File Location
LOG_FILE="/home/abhijeet/dec-2025/system_monitor/system-monitoring-script/system_monitor.log"

# Ensure file exists
touch "$LOG_FILE"

# Clear previous logs
> "$LOG_FILE"

# Logging Function
log_alert() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

#DISK USAGE CODE

echo -e "${BLUE}==============================${NC}"
echo -e "${BLUE}   System Monitoring Report   ${NC}"
echo -e "${BLUE}==============================${NC}"
echo "Date: $(date)"
echo ""

echo -e ${BLUE}"Disk Usage Monitoring${NC}"
echo "------------------------------"

echo -e ${YELLOW}"Checking disk usage...${NC}"
DISK_USAGE=$(df -h | awk 'NR==2 {print $5}' | sed 's/%//')
echo "Current disk usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
#MSG="Disk usage exceeded: $DISK_USAGE%"
   #log_alert "$MSG"
        echo -e ${RED}"WARNING: DISK usage exceeded: ($DISK_USAGE%)${NC}"
        log_alert "WARNING: DISK usage exceeded: ($DISK_USAGE%)"
else
        echo -e ${GREEN}"Disk usage is under control${NC}"
        log_alert "INFO: Disk usage normal ($DISK_USAGE%)"
fi
echo ""


#MEMORY MONITOR USAGE CODE

echo -e ${BLUE}"Memory Usage Monitoring${NC}"
echo "------------------------------"

echo -e ${YELLOW}"Checking memory usage...${NC}"
MEMORY_USAGE=$(free | awk 'NR==2 {printf("%.0f"), $3/$2 * 100}')
echo "Current memory usage: $MEMORY_USAGE"
if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
#MSG="Memory usage exceeded: $MEMORY_USAGE%"
   # log_alert "$MSG"
        echo -e ${RED}"WARNING: MEMORY usage exceeded threshold: $MEMORY_USAGE${NC}"
        log_alert "WARNING: Memory usage exceeded ($MEMORY_USAGE%)"
else
        echo -e ${GREEN}"Memory usage is under control${NC}"
        log_alert "INFO: Memory usage normal ($MEMORY_USAGE%)"
fi
echo ""

echo -e ${BLUE}"Top CPU & Memory Processes${NC}"
echo "------------------------------"

echo -e ${YELLOW}"Top 5 CPU Consuming Processes:${NC}"

TOP_CPU=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6)
echo "$TOP_CPU"
log_alert "Top 5 CPU Processes:"
echo "$TOP_CPU" >> "$LOG_FILE"

echo -e ${YELLOW}"Top 5 Memory Consuming Processes:${NC}"
TOP_MEM=$(ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6)
echo "$TOP_MEM"
log_alert "Top 5 Memory usage:"
echo "$TOP_MEM" >> "$LOG_FILE"

echo ""
echo -e ${GREEN}"Monitoring Completed.${NC}"
