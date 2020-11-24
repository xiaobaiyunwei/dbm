#!/bin/bash
#grep -v 'OK' /opt/devops/cmd/dbm.log|awk '{print $4 " " $5}'|sort|uniq -c|sort -k1,1nr|head -10
grep -v 'OK' /opt/devops/cmd/dbm.log|head -$1|awk '{print $4 " " $5}'|grep -v '^$'|sort|uniq -c|sort -k1,1nr|head -10
#grep -v 'OK' /opt/devops/cmd/dbm.log|head -$1|awk '{if($2~/\[0/)print $4 " " $5}'|grep -v '^$'|sort|uniq -c|sort -k1,1nr|head -10
