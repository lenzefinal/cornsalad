package com.devone.finalp.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AProject implements java.io.Serializable {

	private static final long serialVersionUID = 5124165766534205419L;

	private int rnum;
	private String project_category_name;
	private String category_sub_name;
	private String project_id;
	private String project_name;
	private String member_name;
	private Date creation_date;
	private String project_request_flag;
	private String project_onoff_flag;
	private int target_amount;
	private int report_count;
	private Date start_date;
	private Date end_date;
	private int spon;
	private String ing_flag;
	
	public AProject() {}

	public AProject(int rnum,String project_category_name, String category_sub_name, String project_id, String project_name,
			String member_name, Date creation_date,String project_request_flag, String project_onoff_flag, int target_amount, int report_count,
			Date start_date, Date end_date, int spon,String ing_flag) {
		super();
		this.rnum=rnum;
		this.project_category_name = project_category_name;
		this.category_sub_name = category_sub_name;
		this.project_id = project_id;
		this.project_name = project_name;
		this.member_name = member_name;
		this.creation_date = creation_date;
		this.project_request_flag=project_request_flag;
		this.project_onoff_flag = project_onoff_flag;
		this.target_amount = target_amount;
		this.report_count = report_count;
		this.start_date = start_date;
		this.end_date = end_date;
		this.spon = spon;
		this.ing_flag=ing_flag;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getProject_category_name() {
		return project_category_name;
	}

	public void setProject_category_name(String project_category_name) {
		this.project_category_name = project_category_name;
	}

	public String getCategory_sub_name() {
		return category_sub_name;
	}

	public void setCategory_sub_name(String category_sub_name) {
		this.category_sub_name = category_sub_name;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public String getProject_request_flag() {
		return project_request_flag;
	}

	public void setProject_request_flag(String project_request_flag) {
		this.project_request_flag = project_request_flag;
	}

	public String getProject_onoff_flag() {
		return project_onoff_flag;
	}

	public void setProject_onoff_flag(String project_onoff_flag) {
		this.project_onoff_flag = project_onoff_flag;
	}

	public int getTarget_amount() {
		return target_amount;
	}

	public void setTarget_amount(int target_amount) {
		this.target_amount = target_amount;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
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

	public int getSpon() {
		return spon;
	}

	public void setSpon(int spon) {
		this.spon = spon;
	}
	
	public String getIng_flag() {
		return ing_flag;
	}

	public void setIng_flag(String ing_flag) {
		this.ing_flag = ing_flag;
	}

	@Override
	public String toString() {
		return "AProject [rnum=" + rnum + ", project_category_name=" + project_category_name + ", category_sub_name="
				+ category_sub_name + ", project_id=" + project_id + ", project_name=" + project_name + ", member_name="
				+ member_name + ", creation_date=" + creation_date + ", project_request_flag=" + project_request_flag
				+ ", project_onoff_flag=" + project_onoff_flag + ", target_amount=" + target_amount + ", report_count="
				+ report_count + ", start_date=" + start_date + ", end_date=" + end_date + ", spon=" + spon
				+ ", ing_flag=" + ing_flag + "]";
	}

}
