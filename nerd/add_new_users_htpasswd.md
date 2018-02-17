# Create New Users for NTOP or ELK

Friday, 04. November 2016 02:34PM

### NTOP

User accounts are stored in:
>/etc/nginx/.htpasswd

To add additional accounts:

	sudo sh -c "echo 'NEW_USERNAME:`(openssl passwd -apr1)` >> /etc/nginx/.htpasswd"
	sudo htpasswd -c /etc/nginx/.htpasswd NEW_USERNAME

***


### ELK

User account are stored in:
>/etc/nginx/htpasswd.users

To add additional accounts:

	sudo sh -c "echo 'NEW_USERNAME:`(openssl passwd -apr1)` >> /etc/nginx/htpasswd.users"
	sudo htpasswd -c /etc/nginx/htpasswd.users NEW_USERNAME
