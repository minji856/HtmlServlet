package com.example;

public class RequestBean {
	private String header;
	private String footer;
	
	public String getHeader() {
		return header;
	}
	
	public void setHeader(String header) {
		this.header = header;
	}
	
	public String getFooter() {
		return footer;
	}
	
	public void setFooter(String footer) {
		this.footer = footer;
	}
}
// 실제로 저장하려면 쓸려고 하는 애가 메모리에 저장해줘야한다.