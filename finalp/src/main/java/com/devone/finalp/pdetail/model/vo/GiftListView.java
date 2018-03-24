package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class GiftListView implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 436843636452763986L;
	private String project_id;
	private String gift_id;
	private int capacity;
	private Date payment_date;
	private int support_price;
	private int sellcount;
	private int remain;

	public GiftListView() {
	}

	public GiftListView(String project_id, String gift_id, int capacity, Date payment_date, int support_price,
			int sellcount, int remain) {
		super();
		this.project_id = project_id;
		this.gift_id = gift_id;
		this.capacity = capacity;
		this.payment_date = payment_date;
		this.support_price = support_price;
		this.sellcount = sellcount;
		this.remain = remain;
	}

	public int getSellcount() {
		return sellcount;
	}

	public void setSellcount(int sellcount) {
		this.sellcount = sellcount;
	}

	public int getRemain() {
		return remain;
	}

	public void setRemain(int remain) {
		this.remain = remain;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
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

	@Override
	public String toString() {
		return "GiftListView [project_id=" + project_id + ", gift_id=" + gift_id + ", capacity=" + capacity
				+ ", payment_date=" + payment_date + ", support_price=" + support_price + "]";
	}

}
