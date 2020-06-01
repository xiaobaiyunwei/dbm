mongodb/insertOperateLog.jsp 
用途：调用该接口插入开放平台后台系统操作日志
所需参数：operator(操作人的userName),operateURL(操作增删改或发送短信等时的请求后台URL),operateParam(操作时传到后台的参数)

deleteMsg.jsp
用途：删除开放平台短消息
所需参数：messegeID,fromIsDel,toIsDel,isRead,fromUserType,isValid

editBar.jsp
用途：未知（前后台皆未调用）

getCountUnReadNews.jsp
用途：查询未读短消息的数目
所需参数：无

getJs.jsp
用途：判断是否登录 返回-1：未登录 0：已登录

getRoleInfo.jsp
用途：获取用户的角色权限 1：对外审核权限 2：对内审核权限 3：仲裁权限

newStationRe.jsp
用途:短消息前台回复
参数：title,userID,fromUserID,messageID,content

secure_link.jsp
用途：返回防盗链所需参数