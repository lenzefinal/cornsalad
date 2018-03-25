package com.devone.finalp.mypage.model.vo;

import java.sql.Date;

public class FundingProject implements java.io.Serializable {
	
	private static final long serialVersionUID = -9024103684421755401L;
	private String project_id;
	private String image_rename;
	private String project_name;
	private String product_name;
	private String member_id;
	private Date end_date;
	private String pay_option;
	private int size;

	public FundingProject() {

	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getPay_option() {
		return pay_option;
	}

	public void setPay_option(String pay_option) {
		this.pay_option = pay_option;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public FundingProject(String project_id, String image_rename, String project_name, String product_name,
			String member_id, Date end_date, String pay_option, int size) {
		super();
		this.project_id = project_id;
		this.image_rename = image_rename;
		this.project_name = project_name;
		this.product_name = product_name;
		this.member_id = member_id;
		this.end_date = end_date;
		this.pay_option = pay_option;
		this.size = size;
	}



}
