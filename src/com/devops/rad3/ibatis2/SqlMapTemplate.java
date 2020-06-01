package com.devops.rad3.ibatis2;

import java.sql.SQLException;
import java.util.List;

import com.cdeledu.rad3.ibatis2.SqlMapperPool;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SqlMapTemplate {
	
	public static List selectList(String sqlMapper, String sql, Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		return client.queryForList(sql, param);
	}
	
	public static Object selectObject(String sqlMapper, String sql, Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		return client.queryForObject(sql, param);
	}
	
	public static Object insertObject(String sqlMapper, String sql, Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		return client.insert(sql, param);
	}
	
	public static int update(String sqlMapper, String sql, Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		return client.update(sql, param);
	}
	
	public static int delete(String sqlMapper, String sql, Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		return client.delete(sql, param);
	}
	
	public static void callProcedure(String sqlMapper, String sql, Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		client.update(sql, param);
//		return param;
	}
	
	public static Object callProcedureForQuery(String sqlMapper,String sql,Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		return client.queryForList(sql, param);
	}
	
	public static void callProcedureForUpdate(String sqlMapper,String sql,Object param) throws SQLException{
		SqlMapClient client = SqlMapperPool.getClientById(sqlMapper);
		client.update(sql, param);
	}
	
	public static SqlMapClient getTransactionClient(String id){
		return id == null ? null : SqlMapperPool.getClientById(id);
	}

	
}
