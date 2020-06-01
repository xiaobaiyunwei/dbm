<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<input type="hidden" id="subType" value="add"></input>
<table width="700" align="center" cellpadding="0" cellspacing="0" style="margin-top: 3px;" class="tikumore" >
<tr>
			<td style="font-size: 12px; padding: 5px;">				
			名字
			</td>
			<td style="font-size: 12px; padding: 5px;">				
				<input type='text' id="name" name="name" validate="required:true,maxlength:10"	value="">	
			</td>
</tr>
<tr>
			<td style="font-size: 12px; padding: 5px;">				
			年龄
			</td>
			<td style="font-size: 12px; padding: 5px;">				
			<input type='text' id="age" name="age" validate="required:true,number:true,maxlength:3"	value="">	
			</td>
</tr>
<tr>
			<td style="font-size: 12px; padding: 5px;">				
			手机号
			</td>
			<td style="font-size: 12px; padding: 5px;">				
			<input type='text' id="phone" name="phone" validate="phone:true,required:true"	value="">	
			</td>
</tr>
<tr>
			<td style="font-size: 12px; padding: 5px;">				
			描述:
			</td>
			<td style="font-size: 12px; padding: 5px;">				
			<textarea name="describe" id="describe" cols="50" rows="5"
			></textarea>
			</td>
</tr>
<tr >
			<td  colspan="2" >				
			<input   type="submit"    value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;
			<input   type="button"  onclick="javascript:hiddenDiv('demo_add');"  value="取消" />	
			</td>
</tr>
</table>
