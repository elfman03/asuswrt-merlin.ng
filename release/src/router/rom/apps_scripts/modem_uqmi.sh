#!/bin/sh
# $*: QMI cmd, 
# echo "This is a script to execute the QMI command."

if [ -z "$unit" ] || [ "$unit" -eq "0" ]; then
	prefix="usb_modem_"
else
	prefix="usb_modem${unit}_"
fi
modem_type=`nvram get ${prefix}act_type`

if [ "$modem_type" != "qmi" ] ; then
	echo "Modem is not qmi"
	exit 0
fi

stop_lock=`nvram get stop_atlock`
if [ -n "$stop_lock" ] && [ "$stop_lock" -eq "1" ]; then
	at_lock=""
else
	at_lock="flock -x /tmp/at_cmd_lock"
fi

$at_lock uqmi $*
ret=$?
exit $ret

