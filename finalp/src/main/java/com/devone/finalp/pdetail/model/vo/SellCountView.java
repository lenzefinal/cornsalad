package com.devone.finalp.pdetail.model.vo;

import java.io.Serializable;

public class SellCountView implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6565309234126646357L;
	private String project_id;
	private String gift_id;
	private int sum_count;
	
	public SellCountView() {}

	public SellCountView(String project_id, String gift_id, int sum_count) {
		super();
		this.project_id = project_id;
		this.gift_id = gift_id;
		this.sum_count = sum_count;
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

	public int getSum_count() {
		return sum_count;
	}

	public void setSum_count(int sum_count) {
		this.sum_count = sum_count;
	}

	
	@Override
	public String toString() {
		return "SellCountView [project_id=" + project_id + ", gift_id=" + gift_id + ", sum_count=" + sum_count + "]";
	}
	
	
	
	

}
