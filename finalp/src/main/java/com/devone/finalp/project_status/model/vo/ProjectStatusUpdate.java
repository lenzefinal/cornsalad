package com.devone.finalp.project_status.model.vo;

import java.sql.Date;

public class ProjectStatusUpdate implements java.io.Serializable {
	
	private static final long serialVersionUID = -7652596063011125364L;
	private String project_id;
	private String project_category_id;
	private String category_sub_id;
	private String project_name;
	private String member_id;
	private String image_oriname;
	private String image_rename;
	private String rep_content;
	private int target_amount;
	private Date creation_date;
	private Date start_date;
	private Date end_date;
	private Date payment_date;
	private String refund_role;
	private String project_request_flag;
	private String project_onoff_flag;
	private int report_count;
	private String certif_flag;
	private String category_id;
	
	public ProjectStatusUpdate() {}

	public ProjectStatusUpdate(String project_id, String project_category_id, String category_sub_id,
			String project_name, String member_id, String image_oriname, String image_rename, String rep_content,
			int target_amount, Date creation_date, Date start_date, Date end_date, Date payment_date,
			String refund_role, String project_request_flag, String project_onoff_flag, int report_count,
			String certif_flag, String category_id) {
		super();
		this.project_id = project_id;
		this.project_category_id = project_category_id;
		this.category_sub_id = category_sub_id;
		this.project_name = project_name;
		this.member_id = member_id;
		this.image_oriname = image_oriname;
		this.image_rename = image_rename;
		this.rep_content = rep_content;
		this.target_amount = target_amount;
		this.creation_date = creation_date;
		this.start_date = start_date;
		this.end_date = end_date;
		this.payment_date = payment_date;
		this.refund_role = refund_role;
		this.project_request_flag = project_request_flag;
		this.project_onoff_flag = project_onoff_flag;
		this.report_count = report_count;
		this.certif_flag = certif_flag;
		this.category_id = category_id;
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

	public String getCategory_sub_id() {
		return category_sub_id;
	}

	public void setCategory_sub_id(String category_sub_id) {
		this.category_sub_id = category_sub_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getImage_oriname() {
		return image_oriname;
	}

	public void setImage_oriname(String image_oriname) {
		this.image_oriname = image_oriname;
	}

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
	}

	public String getRep_content() {
		return rep_content;
	}

	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}

	public int getTarget_amount() {
		return target_amount;
	}

	public void setTarget_amount(int target_amount) {
		this.target_amount = target_amount;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
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

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getRefund_role() {
		return refund_role;
	}

	public void setRefund_role(String refund_role) {
		this.refund_role = refund_role;
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

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public String getCertif_flag() {
		return certif_flag;
	}

	public void setCertif_flag(String certif_flag) {
		this.certif_flag = certif_flag;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProjectStatusUpdate [project_id=" + project_id + ", project_category_id=" + project_category_id
				+ ", category_sub_id=" + category_sub_id + ", project_name=" + project_name + ", member_id=" + member_id
				+ ", image_oriname=" + image_oriname + ", image_rename=" + image_rename + ", rep_content=" + rep_content
				+ ", target_amount=" + target_amount + ", creation_date=" + creation_date + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", payment_date=" + payment_date + ", refund_role=" + refund_role
				+ ", project_request_flag=" + project_request_flag + ", project_onoff_flag=" + project_onoff_flag
				+ ", report_count=" + report_count + ", certif_flag=" + certif_flag + ", category_id=" + category_id
				+ "]";
	}

}
