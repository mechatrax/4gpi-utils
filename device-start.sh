#!/bin/bash

if [ "$AUTO_ON" != "0" ]
then
  if [ $(4gpictl status) != "on" ]
  then
    4gpictl --nowait poweron
  fi
fi

