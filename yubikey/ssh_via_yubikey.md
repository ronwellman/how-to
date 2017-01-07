#Yubikey Setup for SSH


###Required Repositories and Packages
	sudo add-apt-repositories ppa:yubico/stable
	sudo apt-get update
	sudo apt-get install -y opensc-pkcs11 yubico-piv-tool 

#####Optional Packages
These packages offer graphical methodologies for PIV generation as well as One-Time-Password / Static password generation

	sudo apt-get install -y yubikey-neo-manager yubikey-personalization yubikey-personalization-gui
	
###Generate Public Certificate
	yubico-piv-tool -s 9a generate -o public.pem

	
###Self-Sign and Private Certificate
	yubico-piv-tool -a verify-pin -P *PIN* -a selfsign-certificate -s 9a -S'/CN=SSH Key/' -i public.pem -o cert.pem

###Load Certificate
	yubico-piv-tool -a import-certificate -s 9a -i cert.pem
	
###Generate Public key
	ssh-keygen -D /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so > ~/.ssh/yubikey.pub

	
###Allow SSH to use the Yubikey
	sudo vi /etc/ssh/ssh_config
	#Add line
	PKCS11Provider /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so


###Copy Public key to Destination
	ssh-copy-id -i ~/.ssh/yubikey.pub USERNAME@REMOTE_HOST

####SELINUX####
*On a few occasions, I've had to update permissions, update SELINUX, and restart sshd to get keys to work.*

1. `chmod 700 ~/.ssh`
1. `chmod 600 ~/.ssh/authorized_keys`
1. `restorecon -Rv ~/.ssh`
1. `systemctl restart sshd`