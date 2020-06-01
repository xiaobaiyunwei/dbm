package com.devops.common;

public class BaseDomain {

	/**
	 * 取数据起始行，用于分页
	 */
	int rowNumStart = 0;

	/**
	 * 取数据结束行，用于分页
	 */
	int rowNumEnd = 0;
	
	public int getRowNumStart() {
		return rowNumStart;
	}
	public void setRowNumStart(int rowNumStart) {
		this.rowNumStart = rowNumStart;
	}
	public int getRowNumEnd() {
		return rowNumEnd;
	}
	public void setRowNumEnd(int rowNumEnd) {
		this.rowNumEnd = rowNumEnd;
	}
	
}
