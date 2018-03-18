package com.devone.finalp.board.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Board_Pagectr implements Serializable{
	public Board_Pagectr() {}
	public final static long serialVersionUID = 13L;
	private int startnum;
	private int endnum;
	private int startpage;
	private int endpage;
	private int maxpage;
	private int currentpage;
	private String c_id;
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public int getStartnum() {
		return startnum;
	}
	public void setStartnum(int startnum) {
		this.startnum = startnum;
	}
	public int getEndnum() {
		return endnum;
	}
	public void setEndnum(int endnum) {
		this.endnum = endnum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Board_Pagectr(int startnum, int endnum) {
		super();
		this.startnum = startnum;
		this.endnum = endnum;
	}
	public Board_Pagectr(int startnum, int endnum, int startpage, int endpage, int maxpage, int currentpage, String c_id) {
		super();
		this.startnum = startnum;
		this.endnum = endnum;
		this.startpage = startpage;
		this.endpage = endpage;
		this.maxpage = maxpage;
		this.currentpage = currentpage;
		this.c_id = c_id;
				
	}
	
	
}
