#!/bin/sh
yum install bind bind-utils -y

install -m640 -oroot -gnamed /vagrant/named.conf /etc/
install -m640 -oroot -gnamed /vagrant/example.com.zone /var/named/
install -m640 -oroot -gnamed /vagrant/192.0.2.rev.zone /var/named/

firewall-cmd --permanent --zone=trusted --add-service=dns
firewall-cmd --zone=trusted --change-interface=enp0s8
firewall-cmd --reload
systemctl restart named.service
