#!/bin/bash

echo " ------------------------------------------------------------------------"
echo "
<Wlanset2>  Copyright (C) 2020>  <JJ Posti (techtimejourney.net)>
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it
under GPL Version 3, 29 June 2007 license. OR Apache License version 2.0"

echo " -------------------------------------------------------------------------"
echo "Welcome to 'Wlanset2' program version 0.1."
echo ".........................................................................."


rm /etc/network/interfaces
touch /etc/network/interfaces
ip a
iwconfig
echo "Where is your wlan device (for example:wlp3s0)? "
echo ""
read CARD
ip link set $CARD

#Finding out network cards
echo  "auto wlan" >> /etc/network/interfaces
echo "iface $CARD inet dhcp" >> /etc/network/interfaces

#Setup network
echo "What is your network name? (ESSID)  "

read NET
echo "wpa-ssid $NET" >> /etc/network/interfaces
echo "What is your wlan password? "
read PASS
echo "wpa-psk $PASS" >> /etc/network/interfaces

echo "Protecting /etc/network/interfaces from unauthorized users"
echo ""
chmod 0600 /etc/network/interfaces

#Systemd integrations
touch /etc/systemd/system/wlan.service

echo "[Service]
Type=oneshot
ExecStart=/usr/sbin/ifup $CARD
ExecStop=/usr/sbin/ifdown $CARD
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/wlan.service

#Reload systemd daemon
systemctl daemon-reload

#Start wlan now.
systemctl stop wlan
systemctl start wlan

#Enable as systemd service during boot
systemctl enable wlan


