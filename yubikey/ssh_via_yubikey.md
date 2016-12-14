#Yubikey Setup for SSH


###Required Repositories
	sudo apt-add-repositories ppa:yubico/stable
	sudo apt-get update
	sudo apt-get install -y opensc-pkcs11 yubico-piv-tool

	
###Generate Private Certificate
	yubico-piv-tool -s 9a generate -o public.pem

	
###Self-Sign and Load Private Certificate
	yubico-piv-tool -a verify-pin -P *PIN* -a selfsign-certificate -s 9a -S'/CN=SSH Key/' -i public.pem -o cert.pem

	
###Generate Public key
	ssh-keygen -D /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so > ~/.ssh/yubikey.pub

	
###Allow SSH to use the Yubikey
	sudo vi /etc/ssh/ssh_config
	#Add line
	PKCS11Provider /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so


###Copy Public key to Destination
	scp ~/.ssh/yubikey.pub USER@REMOTE_IP:/home/USER/.ssh/
	ssh USER@REMOTE_IP 'cat ~/.ssh/yubikey.pub > ~/.ssh/authorized_keys;rm -rf ~/.ssh/yubikey.pub'

####SELINUX####
*On a few occasions, I've had to update permissions, update SELINUX, and restart sshd to get keys to work.*
1. `chmod 700 ~/.ssh`
1. `chmod 600 ~/.ssh/authorized_keys`
1. `restorecon -Rv ~/.ssh`
1. `systemctl restart sshd`