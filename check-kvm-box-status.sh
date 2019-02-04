#!/bin/bash

echo ""; echo "Hostname: $(hostname)"; echo "";  echo "Host OS: $(python -c 'import platform; print platform.dist()')"; x=$(awk '/MemTotal/ {print $2}' /proc/meminfo) ; echo Memory: $(bc <<< "scale=2; $x/1024/1024") GB; echo ""; echo "CPU info:"; lscpu | grep 'Virt\|^CPU(s)'; echo ""; echo "Grep lsmod for kvm:"; lsmod | grep '^kvm'; echo ""; echo "Grep cpuinfo for vmx|smx:"; grep flags /proc/cpuinfo|head -n1|grep -Eo '(vmx|svm)'
