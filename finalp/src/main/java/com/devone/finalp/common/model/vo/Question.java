package com.devone.finalp.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Question implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1094631770038932839L;
	private int question_id;
	private String question_category_id;
	private String receive_member_id;
	private String send_member_id;
	private String title;
	private String content;
	private String re_content;
	private Date send_creation_date;
	private Date receive_creation_date;

	public Question() {}

	public Question(int question_id, String question_category_id, String receive_member_id, String send_member_id,
			String title, String content, String re_content, Date send_creation_date, Date receive_creation_date) {
		super();
		this.question_id = question_id;
		this.question_category_id = question_category_id;
		this.receive_member_id = receive_member_id;
		this.send_member_id = send_member_id;
		this.title = title;
		this.content = content;
		this.re_content = re_content;
		this.send_creation_date = send_creation_date;
		this.receive_creation_date = receive_creation_date;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public String getQuestion_category_id() {
		return question_category_id;
	}

	public void setQuestion_category_id(String question_category_id) {
		this.question_category_id = question_category_id;
	}

	public String getReceive_member_id() {
		return receive_member_id;
	}

	public void setReceive_member_id(String receive_member_id) {
		this.receive_member_id = receive_member_id;
	}

	public String getSend_member_id() {
		return send_member_id;
	}

	public void setSend_member_id(String send_member_id) {
		this.send_member_id = send_member_id;
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

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Date getSend_creation_date() {
		return send_creation_date;
	}

	public void setSend_creation_date(Date send_creation_date) {
		this.send_creation_date = send_creation_date;
	}

	public Date getReceive_creation_date() {
		return receive_creation_date;
	}

	public void setReceive_creation_date(Date receive_creation_date) {
		this.receive_creation_date = receive_creation_date;
	}

	@Override
	public String toString() {
		return "Question [question_id=" + question_id + ", question_category_id=" + question_category_id
				+ ", receive_member_id=" + receive_member_id + ", send_member_id=" + send_member_id + ", title=" + title
				+ ", content=" + content + ", re_content=" + re_content + ", send_creation_date=" + send_creation_date
				+ ", receive_creation_date=" + receive_creation_date + "]";
	}
	
	

}
