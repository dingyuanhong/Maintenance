#!/bin/bash
#日志清理脚本

pids=$(ps -ax | grep mongod | grep -v grep | awk '{print $1}')

for pid in $pids
do
echo $pid
sudo kill -SIGUSR1 $pid
done
sudo rm -f /data/wwwroot/mongodb/logs/*.log.*