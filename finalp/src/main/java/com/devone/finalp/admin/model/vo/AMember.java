package com.devone.finalp.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AMember implements java.io.Serializable {

	private static final long serialVersionUID = -3112410139262953296L;
	
	private String member_id;
	private String member_name;
	private int age;
	private String gender;
	private String email;
	private String phone;
	private int total_report_count;
	private String black_flag;
	private int project_count;
	private int spon_money;
	
	public AMember() {}

	public AMember(String member_id, String member_name, int age, String gender, String email, String phone,
			int total_report_count, String black_flag, int project_count, int spon_money) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.total_report_count = total_report_count;
		this.black_flag = black_flag;
		this.project_count = project_count;
		this.spon_money = spon_money;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getTotal_report_count() {
		return total_report_count;
	}

	public void setTotal_report_count(int total_report_count) {
		this.total_report_count = total_report_count;
	}

	public String getBlack_flag() {
		return black_flag;
	}

	public void setBlack_flag(String black_flag) {
		this.black_flag = black_flag;
	}

	public int getProject_count() {
		return project_count;
	}

	public void setProject_count(int project_count) {
		this.project_count = project_count;
	}

	public int getSpon_money() {
		return spon_money;
	}

	public void setSpon_money(int spon_money) {
		this.spon_money = spon_money;
	}

	@Override
	public String toString() {
		return "AMember [member_id=" + member_id + ", member_name=" + member_name + ", age=" + age + ", gender="
				+ gender + ", email=" + email + ", phone=" + phone + ", total_report_count=" + total_report_count
				+ ", black_flag=" + black_flag + ", project_count=" + project_count + ", spon_money=" + spon_money
				+ "]";
	}	
	

}
