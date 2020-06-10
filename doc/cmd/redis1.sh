#!/bin/bash
#$REDIS_HOME/src/redis-cli -h $1 -p $2 monitor >/opt/devops/cmd/dbm.log
$REDIS_HOME/src/redis-cli -h $1 -p $2 monitor|tee /opt/devops/cmd/dbm.log

