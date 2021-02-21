这是一个对redis数据库key使用情况的一个分析平台,方便dba实时监测redis服务运行情况，有助于开发更合理的使用redis。主要功能有  
1、热key分析  
2、大key分析，也就是redis中的key实际占用的内存空间或元素条数，这里边我实现了两种分析方式：  
一种是实时分析（仅限于key的数量在10万以下的db,当前程序配置的是5万），如果key值过多，实时分析有可能会影响redis的正常使用；  
一种是离线分析，对key值多少没有限制，通过分析redis持久化文件dupp.rdb文件实现。  
3、数据库字典管理  

4、实时分析实现原理
以ip、端口号作为转入参数，通过redis-cli命令monitor输出日志进行分析
/src/redis-cli -h $1 -p $2 monitor   
5、离线分析实现原理  
通过redis-rdb-tools分析工具，使用rdb命令
 rdb -c memory ./dump.rdb
分析redis的持久化rdb文件
