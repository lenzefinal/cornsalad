package com.devone.finalp.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4487634032609990842L;
	private int report_id;
	private String report_category_id;
	private String project_id;
	private int project_reply_id;
	private int board_id;
	private int board_reply_id;
	private String report_reason;
	private String member_id;
	private Date report_date;
	private String report_read_flag;
	
	public Report() {}
	
	public Report(int report_id, String report_category_id, String project_id, int project_reply_id, int board_id,
			int board_reply_id, String report_reason, String member_id, Date report_date, String report_read_flag) {
		super();
		this.report_id = report_id;
		this.report_category_id = report_category_id;
		this.project_id = project_id;
		this.project_reply_id = project_reply_id;
		this.board_id = board_id;
		this.board_reply_id = board_reply_id;
		this.report_reason = report_reason;
		this.member_id = member_id;
		this.report_date = report_date;
		this.report_read_flag = report_read_flag;
	}

	public int getReport_id() {
		return report_id;
	}

	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}

	public String getReport_category_id() {
		return report_category_id;
	}

	public void setReport_category_id(String report_category_id) {
		this.report_category_id = report_category_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public int getProject_reply_id() {
		return project_reply_id;
	}

	public void setProject_reply_id(int project_reply_id) {
		this.project_reply_id = project_reply_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public int getBoard_reply_id() {
		return board_reply_id;
	}

	public void setBoard_reply_id(int board_reply_id) {
		this.board_reply_id = board_reply_id;
	}

	public String getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public String getReport_read_flag() {
		return report_read_flag;
	}

	public void setReport_read_flag(String report_read_flag) {
		this.report_read_flag = report_read_flag;
	}

	@Override
	public String toString() {
		return "Report [report_id=" + report_id + ", report_categort_id=" + report_category_id + ", project_id="
				+ project_id + ", project_reply_id=" + project_reply_id + ", board_id=" + board_id + ", board_reply_id="
				+ board_reply_id + ", report_reason=" + report_reason + ", member_id=" + member_id + ", report_date="
				+ report_date + ", report_read_flag=" + report_read_flag + "]";
	}
	
	
	
	
	
}
