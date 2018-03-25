package com.devone.finalp.payment.model.vo;

import java.io.Serializable;

public class PayGiftView implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2587182080150824974L;
	
	private String project_id;
	private String gift_id;
	private int support_price;
	private int capacity;
	private int remain;
	
	
	public PayGiftView() {}
	public PayGiftView(String project_id, String gift_id, int support_price, int capacity ,int remain) {
		super();
		this.project_id = project_id;
		this.gift_id = gift_id;
		this.support_price = support_price;
		this.capacity = capacity;
		this.remain = remain;
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
	public int getSupport_price() {
		return support_price;
	}
	public void setSupport_price(int support_price) {
		this.support_price = support_price;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
	@Override
	public String toString() {
		return project_id+", "+gift_id+", "+support_price+", "+remain+", "+capacity;
	}
	
	

}
