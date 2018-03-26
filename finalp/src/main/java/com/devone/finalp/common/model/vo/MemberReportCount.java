package com.devone.finalp.common.model.vo;

public class MemberReportCount implements java.io.Serializable {

	private static final long serialVersionUID = -4149701607793919424L;
	private String member_id;
	private int total_report_count;
	
	public MemberReportCount() {}

	public MemberReportCount(String member_id, int total_report_count) {
		super();
		this.member_id = member_id;
		this.total_report_count = total_report_count;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getTotal_report_count() {
		return total_report_count;
	}

	public void setTotal_report_count(int total_report_count) {
		this.total_report_count = total_report_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MemberReportCount [member_id=" + member_id + ", total_report_count=" + total_report_count + "]";
	}
	
	
}
