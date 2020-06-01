package com.devops.rad3.util;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import net.rubyeye.xmemcached.MemcachedClient;

//import com.cdeledu.rad3.ibatis2.cache.MemcachedUtil;
import com.cdeledu.rad3.ibatis2.cache.MemcachedClientHandler;

public class MemcacheUtil {
//	private static MemcachedClient client = MemcachedUtil.getMemcachedClient();
	private static MemcachedClient client = MemcachedClientHandler.getMemcachedClient();
	private static final String keyPrefix = "member_Status";
	private MemcacheUtil(){
		client.setOpTimeout(5000);
		client.setConnectionPoolSize(50);	
		client.setEnableHeartBeat(false);
	}
	
	public static Object getObject(Object key) {
		String cacheKey = getKey(key);
		try {
			return client.get(cacheKey);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void putObject(Object key, int deadline, Object value) {
		String cacheKey = getKey(key);
		try {
			client.set(cacheKey, deadline, value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Object removeObject(Object key) {
		String cacheKey = getKey(key);
		try{
			return client.delete(cacheKey);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static Map<String, Object> gets(List<String> keyList){
		Collection<String> key = getKeys(keyList);
		try {
			Map<String, Object> map = client.get(key);
			return backKey(map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	private static String getKey(Object key){
		return keyPrefix + key.toString();
	}
	
	private static String backKey(String key){
		return key.substring(keyPrefix.length(), key.length());
	}
	
	private static Collection<String> getKeys(List<String> keyList){
		for(int i=0, sz=keyList.size(); i<sz; i++){
			String key = getKey(keyList.get(i));
			keyList.set(i, key);
		}
		return keyList;
	}
	
	private static Map<String, Object> backKey(Map<String, Object> map){
		Iterator<String> it = map.keySet().iterator();
		List<String> keyList = new LinkedList<String>();
		while(it.hasNext()){
			keyList.add(it.next());
		}
		for(int i=0, sz = keyList.size(); i<sz; i++){
			String key = keyList.get(i);
			Object obj = map.remove(key);
			map.put(backKey(key), obj);
		}
		return map;
	}
}
