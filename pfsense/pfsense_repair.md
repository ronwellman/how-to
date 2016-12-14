#REPAIR PFSENSE AFTER POWERHIT

*After a recent power outage, PFSense did not come back up.  Upon troubleshooting I noticed that it kept rebooting.*

1. Select single user during bootup.
2. `mount` - notice that / is mounted ro - *read-only*
3. run `fsck` and keep selecting y
4. run `fsck` multiple times until file system is reported clean every time
5. `reboot`