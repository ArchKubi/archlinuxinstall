#!/bin/bash

sudo su
timedatectl set-timezone your_timeZone
timedatectl set-local-rtc 0
timedatectl set-ntp true 
exit

