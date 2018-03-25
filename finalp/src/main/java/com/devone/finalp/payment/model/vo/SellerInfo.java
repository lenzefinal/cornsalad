package com.devone.finalp.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SellerInfo implements Serializable {

	private static final long serialVersionUID = 4793133058549617553L;
	
	private String project_id;
	private String project_name;
	private String member_name;
	private String profile_img_rename;
	private Date end_date;

	public SellerInfo() {}

	public SellerInfo(String project_id, String project_name, String member_name,String profile_img_rename ,Date end_date) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.member_name = member_name;
		this.profile_img_rename = profile_img_rename;
		this.end_date = end_date;
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

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getProfile_img_rename() {
		return profile_img_rename;
	}

	public void setProfile_img_rename(String profile_img_rename) {
		this.profile_img_rename = profile_img_rename;
	}

	@Override
	public String toString() {
		return "SellerInfo [project_id=" + project_id + ", project_name=" + project_name + ", member_name="
				+ member_name + ", profile_img_rename=" + profile_img_rename + ", end_date=" + end_date + "]";
	}
	
	
	
}
