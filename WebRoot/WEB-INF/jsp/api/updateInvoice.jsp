<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="false"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<%@page import="java.io.BufferedReader,java.io.BufferedWriter,java.io.InputStreamReader,java.io.OutputStreamWriter"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.HashMap,com.chinatet.common.MD5,java.lang.Math"%>
<%@page import="com.chinatet.rad3.ibatis2.SqlMapTemplate"%>
<%
	String line = "";
	StringBuffer data = new StringBuffer();
	String result = "";
	BufferedReader br = null;
	BufferedWriter bf = null;
	HashMap updateParam = new HashMap();
	String personKey = "kfPtmeZWYsG5lg4i";
	try {
		br = new BufferedReader(new InputStreamReader(request.getInputStream()));
		bf = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()));
		for (line = br.readLine(); line != null;line = br.readLine()) {
			data.append(line);
// 			System.out.println("请求数据：" + line);
		}
		JSONObject json = JSONObject.fromObject(data.toString());
		if(null!=json){
			Integer businessID = json.getInt("BusinessID");
			if(businessID!=100012){
				result = "{State:0,Message:'业务ID不正确！'}";
				return;
			}
			String key = json.getString("Key");
			Long ticks = json.getLong("Ticks");
			Long nowTime = System.currentTimeMillis();
			if(Math.abs(nowTime-ticks)>180000){
				result = "{State:0,Message:'请求超时！'}";
				return;
			}
			Integer sid = json.getInt("SID");
			String thisKey = MD5.Md5(personKey+"100012"+sid+ticks, 32);
			if(!(thisKey.equals(key))){
				result = "{State:0,Message:'参数有误！'}";
				return;
			}
			Integer invoiceTypeID = json.getInt("InvoiceTypeID");
			String invoiceKey1 = json.getString("InvoiceKey1");
			String invoiceKey2 = json.getString("InvoiceKey2");
			Float invoicePrice = (float)(json.getInt("InvoicePrice"))/100;;
			String invoiceTitle = json.getString("InvoiceTitle");
			String receiveMan = json.getString("ReceiveMan");
			String postAddress = json.getString("PostAddress");
			Integer zip = json.getInt("Zip");
			String phone = json.getString("Phone");
			Integer sendStatus = json.getInt("SendStatus");
			String sendTime = json.getString("SendTime");
			Integer postTypeID = json.getInt("PostTypeID");
			Integer expressTypeID = json.getInt("ExpressTypeID");
			String expressCode = json.getString("ExpressCode");
			String invoiceCode = json.getString("InvoiceCode");
			Integer isRealTimeSend = json.getInt("IsRealTimeSend");
			Integer userID = json.getInt("UID");
			String memberID = json.getString("MemberID");
			String remark = json.getString("Remark");
			Float postPrice = (float)(json.getInt("PostPrice"))/100;
			Integer addressType = json.getInt("AddressType");
			String unitName = json.getString("UnitName");
			Integer orderID = json.getInt("BankId");
			String fullName = json.getString("FullName");
			updateParam.put("sid",sid );
			updateParam.put("invoiceTypeID", invoiceTypeID);
			updateParam.put("invoicePrice",invoicePrice );
			updateParam.put("invoiceTitle",invoiceTitle );
			updateParam.put("receiveMan",receiveMan );
			updateParam.put("postAddress",postAddress );
			updateParam.put("postAddress",postAddress );
			updateParam.put("zip", zip);
			updateParam.put("phone", phone);
			updateParam.put("sendStatus",sendStatus );
			updateParam.put("sendTime",sendTime );
			updateParam.put("postTypeID",postTypeID );
			updateParam.put("expressTypeID",expressTypeID);
			updateParam.put("expressCode",expressCode );
			updateParam.put("invoiceCode",invoiceCode );
			updateParam.put("isRealTimeSend",isRealTimeSend );
			updateParam.put("userID",userID );
// 			updateParam.put("memberID",memberID );
			updateParam.put("remark",remark );
			updateParam.put("postPrice",postPrice );
			updateParam.put("addressType",addressType );
			updateParam.put("unitName",unitName );
			updateParam.put("orderID",orderID );
// 			System.out.println(updateParam.toString());
			SqlMapTemplate.update("fund","ns.order.invoice.updateInvoice",updateParam);
			result = "{State:1,Message:'同步成功！'}";
		}
	} catch (Exception e) {
		result = "{State:0,Message:'ERROR'}";
// 		e.printStackTrace();
	}finally{
// 		System.out.println("result:"+result);
		bf.write(result);
		br.close();
		bf.flush();
		bf.close();
	}
%>