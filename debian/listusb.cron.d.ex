#
# Regular cron jobs for the listusb package
#
0 4	* * *	root	[ -x /usr/bin/listusb_maintenance ] && /usr/bin/listusb_maintenance
