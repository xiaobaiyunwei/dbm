/**
 * 
 */
package com.devops.common;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @author dell
 * 
 */
public class CompareMap {
	@SuppressWarnings({ "unchecked", "unused" })
	public static boolean equalsMap(Map mp1, Map mp2) {
		Set<Object> tempSet = new HashSet<Object>();
		tempSet = mp1.keySet();
		Object[] arrObj = tempSet.toArray();
		for (Object tempObj : arrObj) {
			if (mp2.get(tempObj) == null
					|| !mp2.get(tempObj).toString().equals(
							mp1.get(tempObj).toString())) {
				return false;
			}
		}
		return true;
	}	
	
}


