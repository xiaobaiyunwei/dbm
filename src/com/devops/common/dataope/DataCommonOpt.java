package com.devops.common.dataope;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.devops.common.StringUtil;
import com.devops.rad3.ibatis2.SqlMapTemplate;

public class DataCommonOpt {
	/**
	 * 根据pageSize//每页条数、currPage//当前处于第几页获取起始、结束页码
	 * 
	 * @param map
	 * @return
	 */
	public static Map<String, Object> getPageStartEnd(Map<String, Object> map) {
		int pageSize = 10;
		int currPage = 1;
		String sPageSize = StringUtil.nullToString(map.get("pageSize"));
		if (!sPageSize.equals("")) {
			try {
				pageSize = Integer.parseInt(sPageSize);
			} catch (Exception e) {
				pageSize = 1;
			}
		}
		String scurrPage = StringUtil.nullToString(map.get("currPage"));
		if (!scurrPage.equals("")) {
			try {
				currPage = Integer.parseInt(scurrPage);
			} catch (Exception e) {
				currPage = 10;
			}
		}
		int pageNumStart = 0, pageNumEnd = 0;
		pageNumStart = ((currPage - 1) * pageSize + 1);
		pageNumEnd = (currPage * pageSize);
		map.put("pageSize", pageSize);
		map.put("pageNum", currPage);
		map.put("pageNumStart", pageNumStart);
		map.put("pageNumEnd", pageNumEnd);
		return map;
	}
	public static Map<String, Object> getListForPage1(String sqlMapId,
			String stmtCount, String stmt, Map<String, Object> objParameter) {
		Object objRtn = null;
		List listRtn = null;
		Map<String, Object> result = new HashMap<String, Object>();
		int count = 0;
		try {
			if (objParameter == null) {
				objRtn = SqlMapTemplate.selectObject(sqlMapId, stmtCount, null);
			} else {
				objRtn = SqlMapTemplate.selectObject(sqlMapId, stmtCount,
						objParameter);
			}
			count = (Integer) objRtn;
			String returnType = StringUtil.nullToString(objParameter
					.get("returnType"));
			if (returnType.equals("count")) {
				result.put("count", count);
				return result;
			}
			if (count > 0) {
				if (objParameter == null) {
					listRtn = SqlMapTemplate.selectList(sqlMapId, stmt, null);
				} else {
					listRtn = SqlMapTemplate.selectList(sqlMapId, stmt,
							objParameter);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		result.put("count", count);
		result.put("listRtn", listRtn);
		return result;
	}
	public static Map<String, Object> getListForPage(String sqlMapId,
			String stmtCount, String stmt, Map<String, Object> objParameter) {
		Object objRtn = null;
		List listRtn = null;
		List listRtn1 = null;
		Integer num = 0;
		Map<String, Object> result = new HashMap<String, Object>();
		String userID = objParameter.get("queryUserID").toString();
		int count = 0;
		try {
			if (objParameter == null) {
				objRtn = SqlMapTemplate.selectObject(sqlMapId, stmtCount, null);
			} else {
				objRtn = SqlMapTemplate.selectObject(sqlMapId, stmtCount,
						objParameter);
			}
			count = (Integer) objRtn;
			String returnType = StringUtil.nullToString(objParameter
					.get("returnType"));
			if (returnType.equals("count")) {
				result.put("count", count);
//				return result;
			}
			if (count > 0) {
				if (objParameter == null) {
					listRtn = SqlMapTemplate.selectList(sqlMapId, stmt, null);
				} else {
					listRtn = SqlMapTemplate.selectList(sqlMapId, stmt,
							objParameter);
					objParameter.put("pageNumEnd",count);
					listRtn1 = SqlMapTemplate.selectList(sqlMapId, stmt,
							objParameter);
					for(int i=0;i<listRtn1.size();i++){
				    	Map obj = (Map)listRtn1.get(i);
				    	if(obj.get("messegeType").toString().equals("4")||obj.get("messegeType").toString().equals("5")){
				    		if(obj.get("fromUserID").toString().equals(userID)&&obj.get("fromUserType").toString().equals("1")){
				        		if(obj.get("isRead").toString().equals("0")){
				        			num++;	
				        		}
				        	}
				        	if(obj.get("userID").toString().equals(userID)&&obj.get("fromUserType").toString().equals("0")){
				        		if(obj.get("isRead").toString().equals("0")){
				        			num++;	
				        		}
				        	}
				    	}else{
				    		if(obj.get("isRead").toString().equals("0")){
				    			num++;	
				    		}
				    	}
				    }
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		result.put("count", count);
		result.put("listRtn", listRtn);
		result.put("unRead", num);
		return result;
	}

	public static Integer getEvaluCount(String sqlMapId, String stmtCount,
			String stmt, Integer score, Map map) {
		map.put("score", score);
		map.put("isValid",1);
		int count = 0;
		try {
			Object objRtn = SqlMapTemplate.selectObject(sqlMapId, stmtCount,
					map);
			count = (Integer) objRtn;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public static Map<String, Object> getOneResult(String sqlMapId,
			String stmt, Map<String, Object> objParameter) {
		Object objRtn = null;
		Map<String, Object> result = new HashMap<String, Object>();
		int count = 0;
		try {
			if (objParameter == null) {
				objRtn = SqlMapTemplate.selectObject(sqlMapId, stmt, null);
			} else {
				objRtn = SqlMapTemplate.selectObject(sqlMapId, stmt,
						objParameter);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		result.put("count", count);
		result.put("objRtn", objRtn);
		return result;
	}

}
