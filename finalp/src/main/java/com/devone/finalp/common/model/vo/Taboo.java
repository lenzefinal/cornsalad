package com.devone.finalp.common.model.vo;

public class Taboo implements java.io.Serializable {

	private static final long serialVersionUID = 1708050266563984548L;
	
	private String content;
	
	public Taboo() {}

	public Taboo(String content) {
		super();
		this.content = content;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Taboo [content=" + content + "]";
	}
	
	
	

}
