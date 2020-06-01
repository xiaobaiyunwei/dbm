package com.devops.common;

public class CheckIntegerUtil {

	public static boolean isInt(String num) {
		try {
			Integer.parseInt(num);
			return true;
		} catch (NumberFormatException e) {
			e.getMessage();
			return false;
		}
	}
}
