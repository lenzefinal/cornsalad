package com.devone.finalp.mypage.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class MyFundPay implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3498437887405717318L;
	private String project_id;
	private String project_name;
	private String payment_id;
	private String member_id;
	private String gift_id;
	private String item_name;
	private String pay_option;
	private int total_amount;
	private Date payment_date;
	private int count;

	public MyFundPay() {

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

	public MyFundPay(String project_id, String project_name, String payment_id, String member_id, String gift_id,
			String item_name, String pay_option, int total_amount, Date payment_date, int count) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.payment_id = payment_id;
		this.member_id = member_id;
		this.gift_id = gift_id;
		this.item_name = item_name;
		this.pay_option = pay_option;
		this.total_amount = total_amount;
		this.payment_date = payment_date;
		this.count = count;
	}

	@Override
	public String toString() {
		return "MyFundPay [project_id=" + project_id + ", project_name=" + project_name + ", payment_id=" + payment_id
				+ ", member_id=" + member_id + ", gift_id=" + gift_id + ", item_name=" + item_name + ", pay_option="
				+ pay_option + ", total_amount=" + total_amount + ", payment_date=" + payment_date + ", count=" + count
				+ "]";
	}

}
