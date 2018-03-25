package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class ProjectView implements java.io.Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 689511374207088365L;
	private String project_id;
	private String project_name;
	private String member_name;
	private String image_rename;
	private String rep_content;
	private int target_amount;
	private Date start_date;
	private Date end_date;
	private int dday;
	private Date payment_date;
	private String refund_role;
	private String video_url;
	private String content;
	private String project_category_id;
	private String project_category_name;
	private String category_sub_id;
	private String category_sub_name;
	private String category_id;
	private String category_name;
	private String total_amount;
	private int percent;

	
	public ProjectView() {}
	
	public ProjectView(String project_id, String project_name,String member_name, String image_rename, String rep_content, int target_amount, Date start_date,
			Date end_date,int dday, Date payment_date, String refund_role, String video_url, String content,
			String project_category_id, String project_category_name, String category_sub_id, String category_sub_name,
			String category_id, String category_name, String total_amount,int percent) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.member_name=member_name;
		this.image_rename = image_rename;
		this.rep_content = rep_content;
		this.target_amount = target_amount;
		this.start_date = start_date;
		this.end_date = end_date;
		this.dday=dday;
		this.payment_date = payment_date;
		this.refund_role = refund_role;
		this.video_url = video_url;
		this.content = content;
		this.project_category_id = project_category_id;
		this.project_category_name = project_category_name;
		this.category_sub_id = category_sub_id;
		this.category_sub_name = category_sub_name;
		this.category_id = category_id;
		this.category_name = category_name;
		this.total_amount = total_amount;
		this.percent=percent;

	}
	
	

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getDday() {
		return dday;
	}

	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
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
	public String getVideo_url() {
		return video_url;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}
	
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}

	@Override
	public String toString() {
		return "ProjectView [project_id=" + project_id + ", project_name=" + project_name + ", member_name="
				+ member_name + ", rep_content=" + rep_content + ", target_amount=" + target_amount + ", start_date="
				+ start_date + ", end_date=" + end_date + ", dday=" + dday + ", payment_date=" + payment_date
				+ ", refund_role=" + refund_role + ", video_url=" + video_url + ", content=" + content
				+ ", project_category_id=" + project_category_id + ", project_category_name=" + project_category_name
				+ ", category_sub_id=" + category_sub_id + ", category_sub_name=" + category_sub_name + ", category_id="
				+ category_id + ", category_name=" + category_name + ", total_amount=" + total_amount + ", percent="
				+ percent + ", min=]";
	}
	
	
	
}
