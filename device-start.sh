#!/bin/bash

gpioset gpiochip0 $POWER_PIN=0 $RESET_PIN=0

if [ "$AUTO_ON" != "0" ]
then
	if [ $(4gpictl status) != "on" ]
	then
		4gpictl --nowait poweron
	fi
fi

