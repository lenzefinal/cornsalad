package com.devone.finalp.common.model.vo;

import java.sql.Date;

public class ProjectReply {
	private int project_reply_id;
	private String member_id;
	private String project_id;
	private String reply_content;
	private Date creation_date;
	private int reply_level;
	private int report_count;
	private int proj_reply_id_ref;
	private int reply_seq;
	
	public ProjectReply() {
		
	}


	public ProjectReply(int project_reply_id, String member_id, String project_id, String reply_content,
			Date creation_date, int reply_level, int report_count, int proj_reply_id_ref, int reply_seq) {
		super();
		this.project_reply_id = project_reply_id;
		this.member_id = member_id;
		this.project_id = project_id;
		this.reply_content = reply_content;
		this.creation_date = creation_date;
		this.reply_level = reply_level;
		this.report_count = report_count;
		this.proj_reply_id_ref = proj_reply_id_ref;
		this.reply_seq = reply_seq;
	}

	
	public int getProj_reply_id_ref() {
		return proj_reply_id_ref;
	}


	public void setProj_reply_id_ref(int proj_reply_id_ref) {
		this.proj_reply_id_ref = proj_reply_id_ref;
	}

	public int getProject_reply_id() {
		return project_reply_id;
	}

	public void setProject_reply_id(int project_reply_id) {
		this.project_reply_id = project_reply_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public int getReply_level() {
		return reply_level;
	}

	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public int getReply_seq() {
		return reply_seq;
	}

	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}


	@Override
	public String toString() {
		return "ProjectReply [project_reply_id=" + project_reply_id + ", member_id=" + member_id + ", project_id="
				+ project_id + ", reply_content=" + reply_content + ", creation_date=" + creation_date
				+ ", reply_level=" + reply_level + ", report_count=" + report_count + ", proj_reply_id_ref="
				+ proj_reply_id_ref + ", reply_seq=" + reply_seq + "]";
	}
	
	
}
