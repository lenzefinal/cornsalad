package com.devone.finalp.mypage.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MyProdPay implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2744297601258958070L;
	private String project_id;
	private String project_name;
	private String payment_id;
	private String member_id;
	private String product_name;
	private String product_id;
	private String pay_option;
	private int total_amount;
	private Date payment_date;
	private int count;

	public MyProdPay() {
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getPay_option() {
		return pay_option;
	}

	public void setPay_option(String pay_option) {
		this.pay_option = pay_option;
	}

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public MyProdPay(String project_id, String project_name, String payment_id, String member_id, String product_name,
			String product_id, String pay_option, int total_amount, Date payment_date, int count) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.payment_id = payment_id;
		this.member_id = member_id;
		this.product_name = product_name;
		this.product_id = product_id;
		this.pay_option = pay_option;
		this.total_amount = total_amount;
		this.payment_date = payment_date;
		this.count = count;
	}

	@Override
	public String toString() {
		return "MyProdPay [project_id=" + project_id + ", project_name=" + project_name + ", payment_id=" + payment_id
				+ ", member_id=" + member_id + ", product_name=" + product_name + ", product_id=" + product_id
				+ ", pay_option=" + pay_option + ", total_amount=" + total_amount + ", payment_date=" + payment_date
				+ ", count=" + count + "]";
	}

}
