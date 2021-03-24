#!/bin/bash
systemctl enable firewalld
systemctl start firewalld
systemctl status firewalld 
if [ "$?" -eq 0 ] then echo "firewalld is up"  else echo "firewalld is down"
# allow acces to the DHCP server 
firewalld-cmd --add-service=dhcp --permanent
firewalld-cmd --reload
exit 0 