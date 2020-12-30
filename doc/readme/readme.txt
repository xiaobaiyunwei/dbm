1.cmd目录是针对redis热KEY分析的服务端脚本文件
2.python目录是针对redis大KEY分析的服务端文件
版本：3.5.5
并且需要安装redis-py模块

step1:沙盒安装python
# virtualenv --python=/usr/local/python3/bin/python3 vpython3
step2:安装redis模块
pip install redis


【目录说明】
1、cmd目录：redis热key分析脚本
2、python目录：redis大key分析主程序
3、shell目录：redis大key分析脚本
4、sql目录：项目sql初始化脚本文件