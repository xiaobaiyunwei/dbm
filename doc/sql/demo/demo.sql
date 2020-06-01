---数据源：
 <Resource auth="Container" 
 driverClassName="com.mysql.jdbc.Driver" 
 maxActive="100" maxIdle="30" maxWait="5000" 
 name="jdbc/g12eserver" password="123456" 
 type="javax.sql.DataSource" 
 url="jdbc:mysql://192.168.190.18:3306/g12e_db_new?autoReconnect=true&amp;useUnicode=true&amp;characterEncoding=utf-8"
 username="root"/> 
---demo表结构之oracle。
CREATE TABLE SNS_DEMO (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

--mysql,注意区分大小写。
DROP TABLE IF EXISTS `sns_demo`;
CREATE TABLE  `sns_demo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `describeInfo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8;

--sqlserver
CREATE TABLE [dbo].[sns_demo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[age] [int] NULL,
	[phone] [varchar](30) NULL,
	[describe] [text] NULL,
	[updateTime] [smalldatetime] NULL,
 CONSTRAINT [PK_sns_demo_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sns_demo', @level2type=N'COLUMN',@level2name=N'name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年龄' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sns_demo', @level2type=N'COLUMN',@level2name=N'age'
GO

ALTER TABLE [dbo].[sns_demo] ADD  CONSTRAINT [DF__sns_demo__update__363DB7A5]  DEFAULT (getdate()) FOR [updateTime]
GO


