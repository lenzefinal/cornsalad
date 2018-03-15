package com.devone.finalp.pdetail.model.vo;

public class MemberView implements java.io.Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2034663182939303506L;
	private String project_id;
	private String member_id;
	private String image_rename;
	private String member_name;
	private String email;
	private int corn_grade;
	
	public MemberView() {}
	
	public MemberView(String project_id, String member_id, String image_rename, String member_name, String email,
			int corn_grade) {
		super();
		this.project_id = project_id;
		this.member_id = member_id;
		this.image_rename = image_rename;
		this.member_name = member_name;
		this.email = email;
		this.corn_grade = corn_grade;
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
	public String getImage_rename() {
		return image_rename;
	}
	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
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
	public int getCorn_grade() {
		return corn_grade;
	}
	public void setCorn_grade(int corn_grade) {
		this.corn_grade = corn_grade;
	}
	
	@Override
	public String toString() {
		return "MemberView [project_id=" + project_id + ", member_id=" + member_id + ", image_rename=" + image_rename
				+ ", member_name=" + member_name + ", email=" + email + ", corn_grade=" + corn_grade + "]";
	}
	
	
	
	

}
