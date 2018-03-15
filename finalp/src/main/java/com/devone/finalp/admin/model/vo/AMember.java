package com.devone.finalp.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AMember implements java.io.Serializable {

	private static final long serialVersionUID = -3112410139262953296L;
	
	private int rnum;
	private String member_id;
	private String member_name;
	private int age;
	private String gender;
	private String email;
	private String phone;
	private int total_report_count;
	private String blacklist_flag;
	private String profile_img_oriname;
	private String profile_img_rename;
	private int project_count;
	private int spon_money;
	
	public AMember() {}

	public AMember(int rnum,String member_id, String member_name, int age, String gender, String email, String phone,
			int total_report_count, String blacklist_flag,String profile_img_oriname,String profile_img_rename,
			int project_count, int spon_money) {
		super();
		this.rnum=rnum;
		this.member_id = member_id;
		this.member_name = member_name;
		this.age = age;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.total_report_count = total_report_count;
		this.blacklist_flag = blacklist_flag;
		this.profile_img_oriname = profile_img_oriname;
		this.profile_img_rename = profile_img_rename;
		this.project_count = project_count;
		this.spon_money = spon_money;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getBlacklist_flag() {
		return blacklist_flag;
	}

	public void setBlacklist_flag(String blacklist_flag) {
		this.blacklist_flag = blacklist_flag;
	}

	public String getProfile_img_oriname() {
		return profile_img_oriname;
	}

	public void setProfile_img_oriname(String profile_img_oriname) {
		this.profile_img_oriname = profile_img_oriname;
	}

	public String getProfile_img_rename() {
		return profile_img_rename;
	}

	public void setProfile_img_rename(String profile_img_rename) {
		this.profile_img_rename = profile_img_rename;
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
		return "AMember [rnum=" + rnum + ", member_id=" + member_id + ", member_name=" + member_name + ", age=" + age
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", total_report_count="
				+ total_report_count + ", blacklist_flag=" + blacklist_flag + ", profile_img_oriname="
				+ profile_img_oriname + ", profile_img_rename=" + profile_img_rename + ", project_count="
				+ project_count + ", spon_money=" + spon_money + "]";
	}
	

}
