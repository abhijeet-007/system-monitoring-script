# system-monitoring-script
Build a shell script that monitors key system resources and alerts the user when predefined thresholds are crossed. This simulates basic monitoring and operational automation used daily by DevOps engineers.

System Monitoring Script:
- Disk usage
- Memory usage
- Top CPU-consuming processes
- Top memory-consuming processes
- Logs alerts to a file

Below is the output:

Date: Fri Feb 20 10:16:47 PM IST 2026

Threshold set for Disk usage= 70
Current disk usage: 43%
Disk usage is under control

Threshold set for Memory usage= 15
Current memory usage: 28
WARNING: MEMORY usage exceeded threshold: 28

Top 5 CPU Consuming Processes:
    PID    PPID CMD                         %CPU
   4634    1758 /usr/bin/gnome-software --g  0.9
   4333    1758 /usr/bin/gnome-shell         0.7
   1836    1823 sshd-session: abhijeet@pts/  0.5
    699       1 /usr/libexec/upowerd         0.1
   4498    4446 /usr/libexec/ibus-extension  0.1

Top 5 Memory Consuming Processes:
    PID    PPID CMD                         %MEM
   4333    1758 /usr/bin/gnome-shell         7.9
   4634    1758 /usr/bin/gnome-software --g  3.6
   5674    4446 /usr/bin/python3 /usr/share  2.0
   5119    4333 /usr/libexec/mutter-x11-fra  1.9
   4606    1758 /usr/libexec/evolution-data  1.4





