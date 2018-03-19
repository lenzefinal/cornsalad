package com.devone.finalp.common.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice implements java.io.Serializable {

	private static final long serialVersionUID = -7971014924526158218L;

	private int notice_id;
	private String title;
	private Date creation_date;
	private String content;
	
	public Notice() {}

	public Notice(int notice_id, String title, Date creation_date, String content) {
		super();
		this.notice_id = notice_id;
		this.title = title;
		this.creation_date = creation_date;
		this.content = content;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String gettitle() {
		return title;
	}

	public void settitle(String title) {
		this.title = title;
	}

	public Date getCreation_date() {
		return creation_date;
	}

	public void setCreation_date(Date creation_date) {
		this.creation_date = creation_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Notice [notice_id=" + notice_id + ", title=" + title + ", creation_date=" + creation_date
				+ ", content=" + content + "]";
	}
	
}
