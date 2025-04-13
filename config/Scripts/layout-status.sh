#!/usr/bin/env bash

layout="$(cat /etc/vconsole.conf | grep KEYMAP | awk -F'=' '{print toupper($2)}')"
printf "%s   " "$layout"
