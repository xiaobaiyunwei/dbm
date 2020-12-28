package com.devops.redis.domain;

import java.sql.Timestamp;

/**
 * 框架实例domain对象;
 * @author guiguketang
 *
 */
public class RedisData{
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}
	private Integer id; 
	private String ip;
	private Timestamp createtime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
		
}
