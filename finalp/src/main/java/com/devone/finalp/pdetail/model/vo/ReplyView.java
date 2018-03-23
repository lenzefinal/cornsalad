package com.devone.finalp.pdetail.model.vo;

import java.sql.Date;

public class ReplyView implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 724851946186970597L;
	private int project_reply_id;
	private String project_id;
	private String member_id;
	private String member_name;
	private String profile_img_rename;
	private String reply_content;
	private int reply_level;
	private int proj_reply_id_ref;
	private int preply_seq;
	private Date creation_date;
	private int report_count;
	
	public ReplyView() {}

	public ReplyView(int project_reply_id, String project_id, String member_id, String member_name,
			String profile_img_rename, String reply_content, int reply_level, int proj_reply_id_ref, int preply_seq,
			Date creation_date, int report_count) {
		super();
		this.project_reply_id = project_reply_id;
		this.project_id = project_id;
		this.member_id = member_id;
		this.member_name = member_name;
		this.profile_img_rename = profile_img_rename;
		this.reply_content = reply_content;
		this.reply_level = reply_level;
		this.proj_reply_id_ref = proj_reply_id_ref;
		this.preply_seq = preply_seq;
		this.creation_date = creation_date;
		this.report_count = report_count;
	}

	public int getProject_reply_id() {
		return project_reply_id;
	}

	public void setProject_reply_id(int project_reply_id) {
		this.project_reply_id = project_reply_id;
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

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getProfile_img_rename() {
		return profile_img_rename;
	}

	public void setProfile_img_rename(String profile_img_rename) {
		this.profile_img_rename = profile_img_rename;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReply_level() {
		return reply_level;
	}

	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}

	public int getProj_reply_id_ref() {
		return proj_reply_id_ref;
	}

	public void setProj_reply_id_ref(int proj_reply_id_ref) {
		this.proj_reply_id_ref = proj_reply_id_ref;
	}

	public int getPreply_seq() {
		return preply_seq;
	}

	public void setPreply_seq(int preply_seq) {
		this.preply_seq = preply_seq;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ReplyView [project_reply_id=" + project_reply_id + ", project_id=" + project_id + ", member_id="
				+ member_id + ", member_name=" + member_name + ", profile_img_rename=" + profile_img_rename
				+ ", reply_content=" + reply_content + ", reply_level=" + reply_level + ", proj_reply_id_ref="
				+ proj_reply_id_ref + ", preply_seq=" + preply_seq + ", creation_date=" + creation_date
				+ ", report_count=" + report_count + "]";
	}
	
	
	

}
