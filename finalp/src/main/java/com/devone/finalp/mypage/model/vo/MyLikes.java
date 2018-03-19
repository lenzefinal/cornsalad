package com.devone.finalp.mypage.model.vo;

import org.springframework.stereotype.Component;

@Component
public class MyLikes implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3327746337064135599L;
	private String project_id;
	private String member_id;
	private String project_name;
	private String creation_date;
	private String image_rename;
	private int size;

	public MyLikes() {

	}

	public MyLikes(String project_id, String member_id, String project_name, String creation_date, String image_rename,
			int size) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
		this.project_name = project_name;
		this.creation_date = creation_date;
		this.image_rename = image_rename;
		this.size = size;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
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

	@Override
	public String toString() {
		return "MyLikes [project_id=" + project_id + ", member_id=" + member_id + ", project_name=" + project_name
				+ ", creation_date=" + creation_date + ", image_rename=" + image_rename + "]";
	}

}
