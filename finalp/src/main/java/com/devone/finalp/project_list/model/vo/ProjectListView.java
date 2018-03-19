package com.devone.finalp.project_list.model.vo;

import java.sql.Date;

public class ProjectListView {
	
	private String project_id;
	private String image_rename;
	private String project_name;
	private String project_category_id;
	private String project_category_name;
	private String category_sub_id;
	private String category_sub_name;
	private String category_id;
	private String category_name;
	private Date start_date;
	private Date end_date;
	private String member_id;
	private String member_name;
	private int target_amount;
	private int total_amount;
	private String percent;
	
	public ProjectListView() {
		
	}
	
	public ProjectListView(String project_id, String image_rename, String project_name, String project_category_id,
			String project_category_name, String category_sub_id, String category_sub_name, String category_id,
			String category_name, Date start_date, Date end_date, String member_id, String member_name,
			int target_amount, int total_amount, String percent) {
		super();
		this.project_id = project_id;
		this.image_rename = image_rename;
		this.project_name = project_name;
		this.project_category_id = project_category_id;
		this.project_category_name = project_category_name;
		this.category_sub_id = category_sub_id;
		this.category_sub_name = category_sub_name;
		this.category_id = category_id;
		this.category_name = category_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.member_id = member_id;
		this.member_name = member_name;
		this.target_amount = target_amount;
		this.total_amount = total_amount;
		this.percent = percent;
	}

	

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	
	public String getProject_category_id() {
		return project_category_id;
	}

	public void setProject_category_id(String project_category_id) {
		this.project_category_id = project_category_id;
	}

	public String getProject_category_name() {
		return project_category_name;
	}

	public void setProject_category_name(String project_category_name) {
		this.project_category_name = project_category_name;
	}

	public String getCategory_sub_id() {
		return category_sub_id;
	}

	public void setCategory_sub_id(String category_sub_id) {
		this.category_sub_id = category_sub_id;
	}

	public String getCategory_sub_name() {
		return category_sub_name;
	}

	public void setCategory_sub_name(String category_sub_name) {
		this.category_sub_name = category_sub_name;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
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

	public int getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	
	

	public int getTarget_amount() {
		return target_amount;
	}

	public void setTarget_amount(int target_amount) {
		this.target_amount = target_amount;
	}

	public String getPercent() {
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	@Override
	public String toString() {
		return "ProjectListView [project_id=" + project_id + ", image_rename=" + image_rename + ", project_category_id="
				+ project_category_id + ", project_category_name=" + project_category_name + ", category_sub_id="
				+ category_sub_id + ", category_sub_name=" + category_sub_name + ", category_id=" + category_id
				+ ", category_name=" + category_name + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", member_id=" + member_id + ", member_name=" + member_name + ", total_amount=" + total_amount + "]";
	}
	
	

}
