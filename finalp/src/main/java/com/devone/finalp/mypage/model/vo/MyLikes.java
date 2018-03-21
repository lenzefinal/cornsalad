package com.devone.finalp.mypage.model.vo;

import java.sql.Date;

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
	private Date creation_date;
	private Date end_date;
	private String image_rename;
	private int size;

	public MyLikes() {

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

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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

	public MyLikes(String project_id, String member_id, String project_name, Date creation_date, Date end_date,
			String image_rename, int size) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
		this.project_name = project_name;
		this.creation_date = creation_date;
		this.end_date = end_date;
		this.image_rename = image_rename;
		this.size = size;
	}

	@Override
	public String toString() {
		return "MyLikes [project_id=" + project_id + ", member_id=" + member_id + ", project_name=" + project_name
				+ ", creation_date=" + creation_date + ", end_date=" + end_date + ", image_rename=" + image_rename
				+ ", size=" + size + "]";
	}


}
