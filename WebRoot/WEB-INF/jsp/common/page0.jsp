<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<table width="700" align="center" height="30" border="0" cellpadding="0" cellspacing="0">		
		<tr>
			<td height="40" align="left">
				<c:if test="${pageObj.currentpage!=pageObj.firstpage}">
				<a href="#" onClick="goPage(${pageObj.firstpage});">
					<font color="#0000FF">首页</font>
				</a>
				&nbsp;
				<a href="#" onClick="goPage(${pageObj.prepage});">
					<font color="#0000FF">上一页</font>
				</a>
				</c:if>
				<c:if test="${pageObj.currentpage==pageObj.firstpage}">首页 上一页</c:if>
				&nbsp;
				<c:if test="${pageObj.currentpage!=pageObj.lastpage}">
					<a href="#" onClick="goPage(${pageObj.nextpage})";><font color="#0000FF">下一页</font></a>
					<a href="#" onClick="goPage(${pageObj.lastpage})";><font color="#0000FF">尾页</font></a> 
				</c:if>
				<c:if test="${pageObj.currentpage==pageObj.lastpage}">
					下一页 尾页
				</c:if>
				跳至 <input id="pageform0" name="pageform0" maxlength="3" size="3" onkeyup="this.value=this.value.replace(/\D/g,'');" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${pageObj.currentpage}"/> 
				<input type="button" name="pageturn" value="跳到" onclick="gotoPage(document.getElementById('pageform0').value);">&nbsp;共${totalCount}条记录
			</td>
		</tr>
	</table>