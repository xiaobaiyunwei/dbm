#!/bin/bash
grep -v 'OK' /opt/devops/cmd/dbm.log|awk '{print $4 " " $5}'|sort|uniq -c|sort -k1,1nr|head -10