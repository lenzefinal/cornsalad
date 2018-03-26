package com.devone.finalp.common.model.vo;

import java.sql.Date;

public class MemberTrust implements java.io.Serializable {

	private static final long serialVersionUID = -1949272227838175770L;
	private String project_id;
	private String member_id;
	private int corn_grade;
	private Date creation_date;
	
	public MemberTrust() {}

	public MemberTrust(String project_id, String member_id, int corn_grade, Date creation_date) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
		this.corn_grade = corn_grade;
		this.creation_date = creation_date;
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

	public int getCorn_grade() {
		return corn_grade;
	}

	public void setCorn_grade(int corn_grade) {
		this.corn_grade = corn_grade;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MemberTrust [project_id=" + project_id + ", member_id=" + member_id + ", corn_grade=" + corn_grade
				+ ", creation_date=" + creation_date + "]";
	}
	
	
}
