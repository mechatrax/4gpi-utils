#!/bin/bash

TIMEOUT=20

ABORT="ABORT BUSY ABORT ERROR"
SCRIPT_FNCMIN="'' AT OK-AT-OK AT+CFUN=0 OK ''"
SCRIPT_PWROFF="'' AT OK-AT-OK AT+CPOF OK ''"
SCRIPT_RI="'' AT OK-AT-OK AT+CFGRI=1 OK AT+CSCLK=1 OK ''"
SCRIPT_SM="'' AT OK-AT-OK AT+CNMI=1,2,0,0,0 OK AT+CPMS=\"SM\",\"SM\",\"SM\" OK ''"
SCRIPT_ME="'' AT OK-AT-OK AT+CNMI=2,1,2,2,0 OK AT+CPMS=\"ME\",\"ME\",\"ME\" OK ''"

if [ "$AUTO_OFF" != "0" ]
then
  if [ "$(4gpictl status)" = "off" ]
  then
    exit 0
  fi
  eval chat -t $TIMEOUT $ABORT $SCRIPT_FNCMIN < $CONSOLE_PORT > $CONSOLE_PORT
  eval chat -t $TIMEOUT $ABORT $SCRIPT_PWROFF < $CONSOLE_PORT > $CONSOLE_PORT
  timeout $TIMEOUT bash -c 'while [ "$(4gpictl status)" != "off" ]; do sleep 1; done' || 4gpictl poweroff
else
  if [ "$WAKE_ON_RING" != "0" ]
  then
    if [ ! -e $CONSOLE_PORT ]
    then
      exit 1
    fi
    if [ "$STORE_SMS_ON_RING" != "0" ]
    then
      eval chat -t $TIMEOUT $ABORT $SCRIPT_ME < $CONSOLE_PORT > $CONSOLE_PORT
    else
      eval chat -t $TIMEOUT $ABORT $SCRIPT_SM < $CONSOLE_PORT > $CONSOLE_PORT
    fi
    eval chat -t $TIMEOUT $ABORT $SCRIPT_RI < $CONSOLE_PORT > $CONSOLE_PORT
  fi
fi

