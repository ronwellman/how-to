# Connect to the Nerd Router

1. Connect to **Infrustructure** Wifi

2. SSH to nerdrouter
	* ```ssh nerdadmin@nerdrouter```

3. Enter Privilege Exec Mode
	* ```enable```

4. Enter the Switch Module
	* ```hw-module session 1/0```

5. Make Adjustments to the Configuration

6. Save the Configuration
	* ```copy run start```
	
7. Exit out of the Switch Module
	* ```<cntrl>+a  <ctrl>+q```

8. Exit out of the Router
	* ```exit```
