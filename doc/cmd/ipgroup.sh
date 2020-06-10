#!/bin/bash
grep -v 'OK' /opt/devops/cmd/dbm.log |awk '{print $3}'|awk -F ':' '{print $1}'|sort|uniq -c|sort -k1,1nr|head -10
