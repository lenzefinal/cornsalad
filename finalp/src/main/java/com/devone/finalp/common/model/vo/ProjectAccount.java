package com.devone.finalp.common.model.vo;

public class ProjectAccount implements java.io.Serializable{

	private static final long serialVersionUID = 2109494586823054083L;
	private String project_id;
	private String bank_id;
	private String account_name;
	private String account_number;
	
	public ProjectAccount() {}

	public ProjectAccount(String project_id, String bank_id, String account_name, String account_number) {
		super();
		this.project_id = project_id;
		this.bank_id = bank_id;
		this.account_name = account_name;
		this.account_number = account_number;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getBank_id() {
		return bank_id;
	}

	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProjectAccount [project_id=" + project_id + ", bank_id=" + bank_id + ", account_name=" + account_name
				+ ", account_number=" + account_number + "]";
	}
	
	
}
