#!/bin/bash
dt=`date +%y-%m-%d`
tm="time +%h-%m"
sudo mysqldump -u root -pabc123. --all-databases > CopiasDeSeguridad/CopiaBD$dt.sql
sudo mkdir /home/skills/Copias/CopiaLogs/Logs$dt | cp /var/log/mysql/* /home/skills/Copias/CopiaLogs/Logs$dt
sudo cp /etc/mysql/my.cnf /home/skills/Copias/FicheroConf$dt
