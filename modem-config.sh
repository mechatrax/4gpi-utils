#!/bin/bash

if [ "$AUTO_OFF" != "0" ]
then
	exit 0
fi

if [ "$WAKE_ON_RING" != "0" ]
then
	4gpictl wake-on-ring disable
fi

