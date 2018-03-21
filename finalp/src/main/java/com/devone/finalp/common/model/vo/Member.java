package com.devone.finalp.common.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements java.io.Serializable {

	private static final long serialVersionUID = 672035754489949870L;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String email;
	private String phone;
	private String address;
	private String address_num;
	private Date enroll_date;
	private String blackList_flag;
	private String admin_flag;
	private String profile_img_oriname;
	private String profile_img_rename;

	public Member() {
	}

	public Member(String member_id, String member_pwd, String member_name, String email, String phone,
			String address_num, String address, Date enroll_date, String blackList_flag, String admin_flag,
			String profile_img_oriname, String profile_img_rename) {
		super();
		this.member_id = member_id;
		this.member_pwd = member_pwd;
		this.member_name = member_name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enroll_date = enroll_date;
		this.blackList_flag = blackList_flag;
		this.admin_flag = admin_flag;
		this.profile_img_oriname = profile_img_oriname;
		this.profile_img_rename = profile_img_rename;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_num() {
		return address_num;
	}

	public void setAddress_num(String address_num) {
		this.address_num = address_num;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getBlackList_flag() {
		return blackList_flag;
	}

	public void setBlackList_flag(String blackList_flag) {
		this.blackList_flag = blackList_flag;
	}

	public String getAdmin_flag() {
		return admin_flag;
	}

	public void setAdmin_flag(String admin_flag) {
		this.admin_flag = admin_flag;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_pwd=" + member_pwd + ", member_name=" + member_name
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", address_num=" + address_num
				+ ", enroll_date=" + enroll_date + ", blackList_flag=" + blackList_flag + ", admin_flag=" + admin_flag
				+ ", profile_img_oriname=" + profile_img_oriname + ", profile_img_rename=" + profile_img_rename + "]";
	}

}
