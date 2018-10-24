#!/bin/bash

TIMEOUT=30
SCRIPT="ABORT BUSY ABORT ERROR '' AT OK-AT-OK AT+CSCLK=0 OK ''"

if [ "$AUTO_OFF" != "0" ]
then
  exit 0
fi

if [ "$WAKE_ON_RING" != "0" ]
then
  eval chat -t $TIMEOUT $SCRIPT < $CONSOLE_PORT > $CONSOLE_PORT
fi

