package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class GiftView implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;
	private String project_id;
	private String gift_id;
	private String item_name;
	private int count;
	
	public GiftView() {}

	public GiftView(String project_id,String gift_id, int support_price, String item_name,int count) {
		super();
		this.project_id = project_id;
		this.gift_id = gift_id;
		this.item_name = item_name;
		this.count=count;
	}

	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}


	public String getGift_id() {
		return gift_id;
	}

	public void setGift_id(String gift_id) {
		this.gift_id = gift_id;
	}


	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	@Override
	public String toString() {
		return "GiftView [project_id=" + project_id + ", gift_id=" + gift_id + ", item_name=" + item_name + ", count="
				+ count + "]";
	}


	
	
	
	
	
	

}
