#!/bin/bash
source /etc/profile
source /home/xiongjianfei/.bashrc
date >> /home/xiongjianfei/time.txt
echo $USER >> /home/xiongjianfei/time.txt
arm-none-linux-gnueabi-gcc 2>> /home/xiongjianfei/time.txt
echo +++++ >> /home/xiongjianfei/time.txt
echo $PATH >> /home/xiongjianfei/time.txt
echo ----- >> /home/xiongjianfei/time.txt
