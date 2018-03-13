package com.devone.finalp.memberaccount.model.vo;

public class MemberAccount implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7910752285540212589L;
	
	private String bank_id;
	private String bank_name;
	private String member_id;
	private String account_number;
	
	public MemberAccount() {}

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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public MemberAccount(String bank_id, String bank_name, String member_id, String account_number) {
		super();
		this.bank_id = bank_id;
		this.bank_name = bank_name;
		this.member_id = member_id;
		this.account_number = account_number;
	}

	@Override
	public String toString() {
		return "MemberAccount [bank_id=" + bank_id + ", bank_name=" + bank_name + ", member_id=" + member_id
				+ ", account_number=" + account_number + "]";
	}
	
	

}
