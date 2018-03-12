package com.devone.finalp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable{
	public final static long serialVersionUID = 1L;
	private int board_id;
	private String board_category_id;
	private String board_category_name; //join 필요
	private String member_id;
	private String member_name; //join 필요
	private String title;
	private String content;
	private Date creation_date;
	private int readcount;
	private int recommend_count;
	private int report_count;
	private String ori_filename;
	private String re_filename;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_category_id() {
		return board_category_id;
	}
	public void setBoard_category_id(String board_category_id) {
		this.board_category_id = board_category_id;
	}
	public String getBoard_category_name() {
		return board_category_name;
	}
	public void setBoard_category_name(String board_category_name) {
		this.board_category_name = board_category_name;
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
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRecommend_count() {
		return recommend_count;
	}
	public void setRecommend_count(int recommend_count) {
		this.recommend_count = recommend_count;
	}
	public String getOri_filename() {
		return ori_filename;
	}
	public void setOri_filename(String ori_filename) {
		this.ori_filename = ori_filename;
	}
	public String getRe_filename() {
		return re_filename;
	}
	public void setRe_filename(String re_filename) {
		this.re_filename = re_filename;
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
	public Board() {}
	public Board(int board_id, String board_category_id, String board_category_name, String member_id,
			String member_name, String title, String content, Date creation_date, int readcount, int recommend_count,
			String ori_filename, String re_filename, int report_count) {
		super();
		this.board_id = board_id;
		this.board_category_id = board_category_id;
		this.board_category_name = board_category_name;
		this.member_id = member_id;
		this.member_name = member_name;
		this.title = title;
		this.content = content;
		this.creation_date = creation_date;
		this.readcount = readcount;
		this.recommend_count = recommend_count;
		this.ori_filename = ori_filename;
		this.re_filename = re_filename;
		this.report_count = report_count;
	}
	@Override
	public String toString() {
		return "Board [board_id=" + board_id + ", board_category_id=" + board_category_id + ", board_category_name="
				+ board_category_name + ", member_id=" + member_id + ", member_name=" + member_name + ", title=" + title
				+ ", content=" + content + ", creation_date=" + creation_date + ", readcount=" + readcount
				+ ", recommend_count=" + recommend_count + ", ori_filename=" + ori_filename + ", re_filename="
				+ re_filename + ", report_count=" + report_count + "]";
	}
	
	
}
