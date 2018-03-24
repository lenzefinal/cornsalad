package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class ProductDetailView implements java.io.Serializable {

	private static final long serialVersionUID = -152838353109203910L;
	private String project_id;
	private String product_id;
	private String product_name;
	private int mincount;
	private int rest_count;
	private int pay_count;
	private Date payment_date;

	public ProductDetailView() {}

	public ProductDetailView(String project_id, String product_id, String product_name, int mincount, int rest_count,
			int pay_count, Date payment_date) {
		super();
		this.project_id = project_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.mincount = mincount;
		this.rest_count = rest_count;
		this.pay_count = pay_count;
		this.payment_date = payment_date;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getMincount() {
		return mincount;
	}

	public void setMincount(int mincount) {
		this.mincount = mincount;
	}

	public int getRest_count() {
		return rest_count;
	}

	public void setRest_count(int rest_count) {
		this.rest_count = rest_count;
	}

	public int getPay_count() {
		return pay_count;
	}

	public void setPay_count(int pay_count) {
		this.pay_count = pay_count;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProductDetailView [project_id=" + project_id + ", product_id=" + product_id + ", product_name="
				+ product_name + ", mincount=" + mincount + ", rest_count=" + rest_count + ", pay_count=" + pay_count
				+ ", payment_date=" + payment_date + "]";
	}

	

	
}
