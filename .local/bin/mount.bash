#!/bin/bash

for P in $(ls /dev/nvme0n1p* ); do echo $P; D=echo $P | cut -d'/' -f 2; mkdir /mnt/"${D}"; mount $P /mnt/"${D}"; done; 

