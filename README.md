
## Network-Scripts2 - Systemd (Debian only)

Network scripts for Lan and Wlan interfaces(Bash)

#### License

This is free software, and you are welcome to redistribute it
under GPL Version 3, 29 June 2007 license. OR Apache License version 2.0.
 
#### Dependencies - The following should be enough:

 
		sudo apt-get install iproute2 wireless-tools wpasupplicant


Run the programs as a sudo (use sudo su) or as a root user inside a terminal client. Examples:

		sudo su

		sh wlanset.sh #For Wlan. 
		
		sh netset.sh #For Lan.

#### Systemd commands

		sudo systemctl status wlan #Wlan service status.


		sudo systemctl status wired #Wired status.


		sudo systemctl stop service_name #Stop the service. Do this if issues appear.


		sudo systemctl start service_name #Start the service.


		sudo systemctl restart service_name #Restart the service.


		sudo systemctl enable service_name #Enable the service during system start.


		sudo systemctl disable service_name #Disable the service during system start.

