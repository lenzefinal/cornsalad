package com.devone.finalp.common.model.vo;

public class Bank implements java.io.Serializable{

	private static final long serialVersionUID = 7654401669707281319L;
	private String bank_id;
	private String bank_name;
	
	public Bank() {}

	public Bank(String bank_id, String bank_name) {
		super();
		this.bank_id = bank_id;
		this.bank_name = bank_name;
	}

	public String getBank_id() {
		return bank_id;
	}

	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Bank [bank_id=" + bank_id + ", bank_name=" + bank_name + "]";
	}
	
	
}
