package com.devone.finalp.payment.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SellerInfo implements Serializable {

	private static final long serialVersionUID = 4793133058549617553L;
	
	private String project_id;
	private String project_name;
	private String memeber_name;
	private Date end_date;

	public SellerInfo() {}

	public SellerInfo(String project_id, String project_name, String memeber_name,Date end_date) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.memeber_name = memeber_name;
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

	public String getMemeber_name() {
		return memeber_name;
	}

	public void setMemeber_name(String memeber_name) {
		this.memeber_name = memeber_name;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	
}
