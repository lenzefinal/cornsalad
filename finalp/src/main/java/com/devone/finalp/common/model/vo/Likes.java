package com.devone.finalp.common.model.vo;

public class Likes {
	
	private String project_id;
	private String member_id;
	
	public Likes() {}

	public Likes(String project_id, String member_id) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
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

	
	@Override
	public String toString() {
		return "Likes [project_id=" + project_id + ", member_id=" + member_id + "]";
	}
	
	
	
	
	
}
