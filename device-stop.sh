#!/bin/bash

TIMEOUT=10
SCRIPT_RI="ABORT BUSY ABORT ERROR '' AT OK-AT-OK AT+CFGRI=1 OK AT+CSCLK=1 OK ''"
SCRIPT_SM="ABORT BUSY ABORT ERROR '' AT OK-AT-OK AT+CNMI=1,2,0,0,0 OK AT+CPMS=\"SM\",\"SM\",\"SM\" OK ''"
SCRIPT_ME="ABORT BUSY ABORT ERROR '' AT OK-AT-OK AT+CNMI=2,1,2,2,0 OK AT+CPMS=\"ME\",\"ME\",\"ME\" OK ''"

if [ "$AUTO_OFF" != "0" ]
then
  4gpictl poweroff
else
  if [ "$WAKE_ON_RING" != "0" ]
  then
    if [ "$STORE_SMS_ON_RING" != "0" ]
    then
      eval chat -t $TIMEOUT $SCRIPT_ME < $CONSOLE_PORT > $CONSOLE_PORT
    else
      eval chat -t $TIMEOUT $SCRIPT_SM < $CONSOLE_PORT > $CONSOLE_PORT
    fi
    eval chat -t $TIMEOUT $SCRIPT_RI < $CONSOLE_PORT > $CONSOLE_PORT
  fi
fi

