# system-monitoring-script
Build a shell script that monitors key system resources and alerts the user when predefined thresholds are crossed. This simulates basic monitoring and operational automation used daily by DevOps engineers.

System Monitoring Script:
- Disk usage
- Memory usage
- Top CPU-consuming processes
- Top memory-consuming processes
- Logs alerts to a file




🖥️ System Monitoring & Alerting Script

A Bash-based system monitoring tool that automatically checks system health metrics, logs results, and sends email alerts when resource usage crosses defined thresholds.
📌 What This Script Does
This script monitors:

✅ Disk usage
✅ Memory usage
✅ Top CPU-consuming processes
✅ Top memory-consuming processes


It:
📄 Logs monitoring results
⚠ Triggers alerts when thresholds are exceeded
🔁 Can run periodically using cron

🎯 Why This Script Is Used
In production systems, high disk or memory usage can:
Slow down applications
Cause service crashes
Lead to downtime
Affect system stability

This script helps:
Detect resource issues early
Notify administrators automatically
Maintain system health
Reduce manual monitoring effort

This script automates:
🔍 Resource monitoring
📊 Process inspection
📝 Logging
📧 Email alerting

⏱ Scheduled health checks (via cron)
🧠 How It Works
Checks disk usage using df
Checks memory usage using free
Compares values against defined thresholds
Logs output .log

Displays top CPU and memory processes

🔧 Configuration
Thresholds
Inside the script:

DISK_THRESHOLD=80
MEMORY_THRESHOLD=75

Log File Location:
LOG_FILE="/home/abhijeet/dec-2025/system_monitor/system-monitoring-script/system_monitor.log"

Modify based on your requirements.

🕒 Automating with Cron

To run every 5 minutes:
crontab -e
Add:
*/5 * * * * /path/to/system_monitor.sh


🚀 Project Purpose

This project demonstrates:
Linux system monitoring
Automation scripting
Threshold-based alerting
Logging best practices
Cron-based scheduling.



