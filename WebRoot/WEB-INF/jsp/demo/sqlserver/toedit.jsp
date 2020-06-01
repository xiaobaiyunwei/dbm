<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@ include file="/WEB-INF/jsp/common/dataope/toedit.jsp"%>
<input type="hidden" id="subType" value="edit"></input>
<form  action="" name="form2" method="post">
<table width="700" align="center" cellpadding="0" cellspacing="0" style="margin-top: 3px;" class="tikumore" >
<tr>
			<td style="font-size: 12px; padding: 5px;">	
			ID			
			</td>
			<td style="font-size: 12px; padding: 5px;">	
			<input type='text' name="id" id="id" readonly	value="${SnsDemo.id}" style="border:0;background:transparent;">	
			</td>
</tr>

<tr>
			<td style="font-size: 12px; padding: 5px;">				
			名字
			</td>
			<td style="font-size: 12px; padding: 5px;">				
				<input type='text' name="name" id="name"	value="${SnsDemo.name}">	
			</td>
</tr>

<tr>
			<td style="font-size: 12px; padding: 5px;">				
			年龄
			</td>
			<td style="font-size: 12px; padding: 5px;">				
			<input type='text' name="age" id="age"	value="${SnsDemo.age}">	
			</td>
		
</tr>

<tr>
			<td style="font-size: 12px; padding: 5px;">				
			手机号
			</td>
			<td style="font-size: 12px; padding: 5px;">				
			<input type='text' name="phone" id="phone"	value="${SnsDemo.phone}">	
			</td>
</tr>

<tr>
			<td style="font-size: 12px; padding: 5px;">				
			描述:
			</td>
			<td style="font-size: 12px; padding: 5px;">				
			${SnsDemo.describe}
			</td>
</tr>
		<td  colspan="2" >				
			<input type='button' onclick='editd()' value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button"  onclick="javascript:hiddenDiv('demo_edit');"  value="取消" />	
		</td>
</table>


</form>

<div id="abcd2"></div>

