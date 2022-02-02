#!/bin/bash
dt=`date +%d-%b-%y_%k:%M`
sudo mysqldump -u root -pabc123. --all-databases > /home/Copias/CopiasDeSeguridad/$dt.sql
sudo mkdir /home/Copias/CopiasLogs/$dt | sudo cp /var/log/mysql/* /home/Copias/CopiaLogs/$dt
sudo cp /etc/mysql/my.cnf /home/Copias/CopiaFicheroConf/$dt
