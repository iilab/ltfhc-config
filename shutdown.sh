#!/bin/bash
ansible all -s -a "/sbin/shutdown -h now" -f 6