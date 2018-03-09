package com.devone.finalp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board_Reply implements Serializable{
	public final static long serialVersionUID = 1L;
	private int board_reply_id;
	private String member_id;
	
	private String member_name;	//join 필요
	private int board_id;
	private String title;
	private String content;
	private Date creation_date;
	private int level;
	private int report_count;
	private int board_reply_id_ref;
	public Board_Reply() {}
	@Override
	public String toString() {
		return "Board_Reply [board_reply_id=" + board_reply_id + ", member_id=" + member_id + ", member_name="
				+ member_name + ", board_id=" + board_id + ", title=" + title + ", content=" + content
				+ ", creation_date=" + creation_date + ", level=" + level + ", report_count=" + report_count
				+ ", board_reply_id_ref=" + board_reply_id_ref + "]";
	}
	public Board_Reply(int board_reply_id, String member_id, String member_name, int board_id, String title,
			String content, Date creation_date, int level, int report_count, int board_reply_id_ref) {
		super();
		this.board_reply_id = board_reply_id;
		this.member_id = member_id;
		this.member_name = member_name;
		this.board_id = board_id;
		this.title = title;
		this.content = content;
		this.creation_date = creation_date;
		this.level = level;
		this.report_count = report_count;
		this.board_reply_id_ref = board_reply_id_ref;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getBoard_reply_id() {
		return board_reply_id;
	}
	public void setBoard_reply_id(int board_reply_id) {
		this.board_reply_id = board_reply_id;
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
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	public int getBoard_reply_id_ref() {
		return board_reply_id_ref;
	}
	public void setBoard_reply_id_ref(int board_reply_id_ref) {
		this.board_reply_id_ref = board_reply_id_ref;
	}
}
