package com.devone.finalp.common.model.vo;

public class Gift implements java.io.Serializable{

	private static final long serialVersionUID = -3136620415618382413L;
	private String gift_id;
	private int support_price;
	private int capacity;
	private String project_id;
	
	public Gift() {}

	public Gift(String gift_id, int support_price, int capacity, String project_id) {
		super();
		this.gift_id = gift_id;
		this.support_price = support_price;
		this.capacity = capacity;
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

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Gift [gift_id=" + gift_id + ", support_price=" + support_price + ", capacity=" + capacity
				+ ", project_id=" + project_id + "]";
	}
	
}
