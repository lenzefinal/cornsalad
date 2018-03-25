package com.devone.finalp.common.model.vo;

public class PaymentCount implements java.io.Serializable {

	private static final long serialVersionUID = 3466597041702637072L;

	private String payment_id;
	private String project_id;
	private String gift_id;
	private String product_id;
	private int count;
	
	public PaymentCount() {}

	public PaymentCount(String payment_id, String project_id, String gift_id, String product_id, int count) {
		
		this.payment_id = payment_id;
		this.project_id = project_id;
		this.gift_id = gift_id;
		this.product_id = product_id;
		this.count = count;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
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

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "PaymentCount [payment_id=" + payment_id + ", project_id=" + project_id + ", gift_id=" + gift_id
				+ ", product_id=" + product_id + ", count=" + count + "]";
	}
	
	
}
