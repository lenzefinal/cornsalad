package com.devone.finalp.common.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable{


	private static final long serialVersionUID = 8018708330215062613L;
	
	private String payment_id;
	private String member_id;
	private String project_id;
	private int total_amount;
	private Date payment_date;
	private Date refund_date;
	private String refund_flag;
	private String pay_option;
	
	public Payment() {}
	
	public Payment(String payment_id,String member_id, String project_id, int total_amount, int total_count, Date payment_date,
			Date refund_date, String refund_flag,String pay_option) {
		super();
		this.payment_id = payment_id;
		this.member_id = member_id;
		this.project_id = project_id;
		this.total_amount = total_amount;
		this.payment_date = payment_date;
		this.refund_date = refund_date;
		this.refund_flag = refund_flag;
		this.pay_option = pay_option;
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

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}


	public Date getPayment_date() {
		return payment_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public String getPay_option() {
		return pay_option;
	}

	public void setPay_option(String pay_option) {
		this.pay_option = pay_option;
	}

	@Override
	public String toString() {
		return "Payment [payment_id=" + payment_id + ", member_id=" + member_id + ", project_id=" + project_id
				+ ", total_amount=" + total_amount + ", payment_date=" + payment_date + ", refund_date=" + refund_date
				+ ", refund_flag=" + refund_flag + ", pay_option=" + pay_option + "]";
	}
	
	

}
