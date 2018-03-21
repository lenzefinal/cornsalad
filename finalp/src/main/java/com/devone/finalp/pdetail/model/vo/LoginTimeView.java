package com.devone.finalp.pdetail.model.vo;

public class LoginTimeView {

	private int min;
	private int second;
	private String member_id;
	
	public LoginTimeView() {}

	public LoginTimeView(int min, int second, String member_id) {
		super();
		this.min = min;
		this.second = second;
		this.member_id = member_id;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getSecond() {
		return second;
	}

	public void setSecond(int second) {
		this.second = second;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "LoginTimeView [min=" + min + ", second=" + second + ", member_id=" + member_id + "]";
	}

	
	
}
