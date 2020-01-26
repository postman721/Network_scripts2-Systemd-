
## Network-Scripts2 - Systemd version (Debian only)

![wlan](https://user-images.githubusercontent.com/29865797/73136833-cedc4d80-405a-11ea-92a9-108af3867a02.jpg)
![screen22](https://user-images.githubusercontent.com/29865797/73136834-d0a61100-405a-11ea-916e-ae6c8b3cbdaf.jpg)

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

