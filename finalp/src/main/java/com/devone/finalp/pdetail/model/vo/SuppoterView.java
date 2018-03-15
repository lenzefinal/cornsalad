package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class SuppoterView {
	
	private String project_id;
	private String member_id;
	private String member_name;
	private Date payment_date;
	private String Refund_flag;
	
	public SuppoterView() {}
	
	public SuppoterView(String project_id, String member_id, String member_name, Date payment_date,
			String refund_flag) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
		this.member_name = member_name;
		this.payment_date = payment_date;
		Refund_flag = refund_flag;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getRefund_flag() {
		return Refund_flag;
	}

	public void setRefund_flag(String refund_flag) {
		Refund_flag = refund_flag;
	}

	
	@Override
	public String toString() {
		return "SuppoterView [project_id=" + project_id + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", payment_date=" + payment_date + ", Refund_flag=" + Refund_flag + "]";
	}
	
	

}
