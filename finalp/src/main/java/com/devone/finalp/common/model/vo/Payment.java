package com.devone.finalp.common.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable{


	private static final long serialVersionUID = 8018708330215062613L;
	
	private String payment_id;
	private String project_id;
	private int gift_id;
	private int product_id;
	private int total_amount;
	private int total_count;
	private Date payment_date;
	private Date refund_date;
	private String refund_flag;
	
	public Payment() {}
	
	public Payment(String payment_id, String project_id, int gift_id, int product_id, int total_amount, int total_count, Date payment_date,
			Date refund_date, String refund_flag) {
		super();
		this.payment_id = payment_id;
		this.project_id = project_id;
		this.gift_id = gift_id;
		this.product_id = product_id;
		this.total_amount = total_amount;
		this.total_count = total_count;
		this.payment_date = payment_date;
		this.refund_date = refund_date;
		this.refund_flag = refund_flag;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public int getGift_id() {
		return gift_id;
	}

	public void setGift_id(int gift_id) {
		this.gift_id = gift_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public Date getRefund_date() {
		return refund_date;
	}

	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}

	public String getRefund_flag() {
		return refund_flag;
	}

	public void setRefund_flag(String refund_flag) {
		this.refund_flag = refund_flag;
	}
	

}
