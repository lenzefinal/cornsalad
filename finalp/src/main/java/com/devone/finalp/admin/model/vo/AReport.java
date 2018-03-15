package com.devone.finalp.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class AReport implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -327143832287029245L;

	private int rnum;
	private int report_id;
	private String report_category_name;
	private String project_id;
	private int project_reply_id;
	private int board_id;
	private int board_reply_id;
	private String black_id;
	private String report_reason;
	private String member_id;
	private Date report_date;
	private String report_project_name;
	private String reply_content;
	private int report_count;
	private String report_read_flag;
	
	public AReport() {}

	public AReport(int rnum, int report_id, String report_category_name, String project_id, int project_reply_id,
			int board_id, int board_reply_id, String black_id, String report_reason, String member_id, Date report_date,
			String report_project_name, String reply_content, int report_count, String report_read_flag) {
		super();
		this.rnum = rnum;
		this.report_id = report_id;
		this.report_category_name = report_category_name;
		this.project_id = project_id;
		this.project_reply_id = project_reply_id;
		this.board_id = board_id;
		this.board_reply_id = board_reply_id;
		this.black_id = black_id;
		this.report_reason = report_reason;
		this.member_id = member_id;
		this.report_date = report_date;
		this.report_project_name = report_project_name;
		this.reply_content = reply_content;
		this.report_count = report_count;
		this.report_read_flag = report_read_flag;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getReport_id() {
		return report_id;
	}

	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}

	public String getReport_category_name() {
		return report_category_name;
	}

	public void setReport_category_name(String report_category_name) {
		this.report_category_name = report_category_name;
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

	public String getBlack_id() {
		return black_id;
	}

	public void setBlack_id(String black_id) {
		this.black_id = black_id;
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

	public String getReport_project_name() {
		return report_project_name;
	}

	public void setReport_project_name(String report_project_name) {
		this.report_project_name = report_project_name;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getReport_count() {
		return report_count;
	}

	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}

	public String getReport_read_flag() {
		return report_read_flag;
	}

	public void setReport_read_flag(String report_read_flag) {
		this.report_read_flag = report_read_flag;
	}

	@Override
	public String toString() {
		return "AReport [rnum=" + rnum + ", report_id=" + report_id + ", report_category_name=" + report_category_name
				+ ", project_id=" + project_id + ", project_reply_id=" + project_reply_id + ", board_id=" + board_id
				+ ", board_reply_id=" + board_reply_id + ", black_id=" + black_id + ", report_reason=" + report_reason
				+ ", member_id=" + member_id + ", report_date=" + report_date + ", report_project_name="
				+ report_project_name + ", reply_content=" + reply_content + ", report_count=" + report_count
				+ ", report_read_flag=" + report_read_flag + "]";
	};

}
