#!/bin/bash

if [ "$AUTO_OFF" != "0" ]
then
	if [ "$(4gpictl status)" = "off" ]
	then
		exit 0
	fi
	4gpictl poweroff || 4gpictl --hard poweroff
else
	if [ "$WAKE_ON_RING" != "0" ]
	then
		if [ ! -e $CONSOLE_PORT ]
		then
			exit 1
		fi
		if [ "$STORE_SMS_ON_RING" != "0" ]
		then
			4gpictl store-sms enable
		else
			4gpictl store-sms disable
		fi
		4gpictl wake-on-ring enable
	fi
fi

