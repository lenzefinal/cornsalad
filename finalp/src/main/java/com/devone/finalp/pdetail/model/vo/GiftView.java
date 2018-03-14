package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class GiftView {
	
	private String project_id;
	private Date payment_date;
	private String gift_id;
	private int support_price;
	private int capacity;
	private String item_id;
	private String item_name;
	
	public GiftView() {}

	public GiftView(String project_id, Date payment_date, String gift_id, int support_price, int capacity,
			String item_id, String item_name) {
		super();
		this.project_id = project_id;
		this.payment_date = payment_date;
		this.gift_id = gift_id;
		this.support_price = support_price;
		this.capacity = capacity;
		this.item_id = item_id;
		this.item_name = item_name;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
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

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	@Override
	public String toString() {
		return "GiftView [project_id=" + project_id + ", payment_date=" + payment_date + ", gift_id=" + gift_id
				+ ", support_price=" + support_price + ", capacity=" + capacity + ", item_id=" + item_id
				+ ", item_name=" + item_name + "]";
	}
	
	
	
	

}
