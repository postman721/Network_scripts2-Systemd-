#!/bin/bash

echo " ------------------------------------------------------------------------"
echo "
<NetSet2>  Copyright (C) 2020>  <JJ Posti (techtimejourney.net)>
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it
under GPL Version 3, 29 June 2007 license. OR Apache License version 2.0"

echo " -------------------------------------------------------------------------"
echo "Welcome to 'NetSet2' program version 0.1."
echo ".........................................................................."


rm /etc/network/interfaces
touch /etc/network/interfaces
ip a
echo ""
echo "Where is your network device (for example:enp4s0)? "
read CARD
ip link set $CARD

#Finding out network cards
echo "
auto $CARD
allow-hotplug $CARD
iface $CARD inet dhcp" > /etc/network/interfaces

echo "Protecting /etc/network/interfaces from unauthorized users"
echo ""
chmod 0600 /etc/network/interfaces

#Systemd integrations
touch /etc/systemd/system/wired	.service

echo "[Service]
Type=oneshot
ExecStart=/usr/sbin/ifup $CARD
ExecStop=/usr/sbin/ifdown $CARD
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/wired.service

#Reload systemd daemon
systemctl daemon-reload

#Start wlan now.
systemctl stop wired
systemctl start wired

#Enable as systemd service during boot
systemctl enable wired


