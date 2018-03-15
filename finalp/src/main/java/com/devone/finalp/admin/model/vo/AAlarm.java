package com.devone.finalp.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class AAlarm implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9074289534162291315L;
	
	private int membercount;
	private int blacklistcount;
	private int projectcount;
	private int productcount;
	private int offprojectcount;
	private int questioncount;
	private int reportcount;
	
	public AAlarm() {}

	public AAlarm(int membercount, int blacklistcount, int projectcount, int productcount, int offprojectcount,
			int questioncount, int reportcount) {
		super();
		this.membercount = membercount;
		this.blacklistcount = blacklistcount;
		this.projectcount = projectcount;
		this.productcount = productcount;
		this.offprojectcount = offprojectcount;
		this.questioncount = questioncount;
		this.reportcount = reportcount;
	}

	public int getMembercount() {
		return membercount;
	}

	public void setMembercount(int membercount) {
		this.membercount = membercount;
	}

	public int getBlacklistcount() {
		return blacklistcount;
	}

	public void setBlacklistcount(int blacklistcount) {
		this.blacklistcount = blacklistcount;
	}

	public int getProjectcount() {
		return projectcount;
	}

	public void setProjectcount(int projectcount) {
		this.projectcount = projectcount;
	}

	public int getProductcount() {
		return productcount;
	}

	public void setProductcount(int productcount) {
		this.productcount = productcount;
	}

	public int getOffprojectcount() {
		return offprojectcount;
	}

	public void setOffprojectcount(int offprojectcount) {
		this.offprojectcount = offprojectcount;
	}

	public int getQuestioncount() {
		return questioncount;
	}

	public void setQuestioncount(int questioncount) {
		this.questioncount = questioncount;
	}

	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}

	@Override
	public String toString() {
		return "AAlarm [membercount=" + membercount + ", blacklistcount=" + blacklistcount + ", projectcount="
				+ projectcount + ", productcount=" + productcount + ", offprojectcount=" + offprojectcount
				+ ", questioncount=" + questioncount + ", reportcount=" + reportcount + "]";
	};

}
