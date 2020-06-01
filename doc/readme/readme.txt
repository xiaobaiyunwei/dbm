说明：
一.开发框架继承自考研网开发框架；在如下方面做了进一步改进；
如有不妥之处，欢迎指正。
1.对原有分页做了进一步封装，将page的属性封装到了标签中；
详见：/jsp/demo/demoList.jsp和/tags/util/page.tag;
2.异步刷新通过jquery实现，详见/jsp/demo.jsp;
3.加入了jquery validate验证框架,详见/jsp/demo.jsp、/jsp/demo/toadd.jsp;
4.所有实例请访问：http://localhost:port/index.jsp?db=sqlserver
二.其他说明
1.开发工具所有文件默认编码全部设置为UTF-8编码，以免乱码带来不必要的麻烦。
  可以到Windows-->Preferences->General-->Content Types进行设置；
2.table_update_record
	记录开发过程中或上线后由于业务或处理问题的需要对原有设计表结构进行修改的记录。
3.接下来开发的系统包的结构按照模块命名。同demo目录平行，其他目录以此往下扩充。
4.注意根据自己web容器的配置修改common.jsp中_currConText的值。
5.在相应的数据库创建demo表。及修改相应的数据库连接。 见doc/sql/demo/demo.sql
  sql创建脚本是mysql下的。 如果数据库使用的不是mysql，请自行调整创建表的sql。
     其他模块的创建表脚本按照模块与demo平行。