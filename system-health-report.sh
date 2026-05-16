#!/bin/bash

LOGFILE="/mnt/c/Sumanth-Prep/Prep-Month1/health-report.log"

echo "===================================" >> $LOGFILE
echo "Health Report - $(date)" >> $LOGFILE
echo "===================================" >> $LOGFILE

echo "Hostname:" >> $LOGFILE
hostname >> $LOGFILE

echo "" >> $LOGFILE
echo "IP Address:" >> $LOGFILE
hostname -I >> $LOGFILE

echo "" >> $LOGFILE
echo "CPU Load:" >> $LOGFILE
top -bn1 | head -5 >> $LOGFILE

echo "" >> $LOGFILE
echo "Memory Usage:" >> $LOGFILE
free -m >> $LOGFILE

echo "" >> $LOGFILE
echo "Disk Usage:" >> $LOGFILE
df -h >> $LOGFILE

echo "" >> $LOGFILE
echo "Service Check:" >> $LOGFILE

if systemctl is-active --quiet nginx
then
    echo "nginx is running" >> $LOGFILE
else
    echo "nginx is NOT running" >> $LOGFILE
fi

if systemctl is-active --quiet ssh
then
    echo "ssh is running" >> $LOGFILE
else
    echo "ssh is NOT running" >> $LOGFILE
fi

echo "" >> $LOGFILE
echo "DNS Lookup:" >> $LOGFILE
nslookup google.com >> $LOGFILE

echo "" >> $LOGFILE
echo "API Response:" >> $LOGFILE
curl -s https://api.github.com/users/octocat | jq '.login, .public_repos' >> $LOGFILE

echo "" >> $LOGFILE
echo "Health check complete." >> $LOGFILE
