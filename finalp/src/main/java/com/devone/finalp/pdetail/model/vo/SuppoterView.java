package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class SuppoterView implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3669081414541318188L;
	private String project_id;
	private String member_id;
	private String member_name;
	private String project_category_name;
	private Date payment_date;
	private String refund_flag;
	private String profile_img_rename;
	
	public SuppoterView() {}
	
	public SuppoterView(String project_id, String member_id, String member_name,String project_category_name, Date payment_date,
			String refund_flag, String profile_img_rename) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
		this.member_name = member_name;
		this.project_category_name=project_category_name;
		this.payment_date = payment_date;
		this.refund_flag = refund_flag;
		this.profile_img_rename=profile_img_rename;
	}

	
	public String getProject_category_name() {
		return project_category_name;
	}

	public void setProject_category_name(String project_category_name) {
		this.project_category_name = project_category_name;
	}



	public String getProfile_img_rename() {
		return profile_img_rename;
	}

	public void setProfile_img_rename(String profile_img_rename) {
		this.profile_img_rename = profile_img_rename;
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

	public void setRefund_flag(String refund_flag) {
		this.refund_flag = refund_flag;
	}
	public String getRefund_flag() {
		return refund_flag;
	}

	@Override
	public String toString() {
		return "SuppoterView [project_id=" + project_id + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", payment_date=" + payment_date + ", Refund_flag=" + refund_flag + ", profile_img_rename="
				+ profile_img_rename + "]";
	}

	

	

}
