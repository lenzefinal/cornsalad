package com.devone.finalp.mypage.model.vo;

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
			String item_name, int count) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.payment_id = payment_id;
		this.member_id = member_id;
		this.gift_id = gift_id;
		this.item_name = item_name;
		this.count = count;
	}
	
}
