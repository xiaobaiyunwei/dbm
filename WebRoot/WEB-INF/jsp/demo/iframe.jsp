﻿<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Language" content="utf-8" />
    <title>iframe</title>
    
    <script type="text/javascript">
        function go() {
            // 调父窗口请用 parent 或 top，如果是多层iframe，需要调用多个parent
            var html = "<div style='padding:10px;'>输入点什么：<input type='text' id='some' name='some' /></div>";
            var submit = function (v, h, f) {
                if (f.some == '') {
                    // f.some 或 h.find('#some').val() 等于 top.$('#some').val()
                    top.$.jBox.tip("请输入点什么。", 'error', { focusId: "some" }); // 关闭设置 some 为焦点
                    return false;
                }
                top.$.jBox.info("你输入了：" + f.some);

                return true;
            };

            top.$.jBox(html, { title: "输入", submit: submit });
        }
    </script>
</head>
<body>
<center>
<button onclick="go()">调用父窗口 jBox </button> 本地测试时，有的浏览没权限，可以用IE来测
</center>
</body>
</html>