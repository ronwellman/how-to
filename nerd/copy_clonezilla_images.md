# Copy Clonezilla Images
#### (_During Master Laptop Imaging_)

1. Plug in the laptop and begin the normal PXE process
	* ```F12```
	* Select **_Boot from NIC_**
	* Select **_Openstack_**
	* Select **_Team Number_**
	* Select **_Master Laptop_**
2. During the imaging process, the local directory structure will be established.  Wait 10 - 15 minutes to ensure the PXE proces has enough time to build those directories
3. Switch to another console
	* ```<ctrl> + <alt> + F2```
4. Copy the Clonezilla Images
	* ```scp -r root@192.168.0.3:/mnt/storage/Images/Clonezilla/*img /mnt/sysimage/var/www/html/images/clonezilla/```
5. You can switch back and forth between consoles to verify progress of the PXE and scp
	* ```<ctrl> + <alt> + F1```
	* ```<ctrl> + <alt> + F2```
