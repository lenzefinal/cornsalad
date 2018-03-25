package com.devone.finalp.pdetail.model.vo;

public class CornGradeView implements java.io.Serializable{

	private static final long serialVersionUID = -3167249663406691393L;
	private String member_id;
	private double corngrade_avg;
	
	public CornGradeView() {}

	public CornGradeView(String member_id, double corngrade_avg) {
		super();
		this.member_id = member_id;
		this.corngrade_avg = corngrade_avg;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public double getCorngrade_avg() {
		return corngrade_avg;
	}

	public void setCorngrade_avg(double corngrade_avg) {
		this.corngrade_avg = corngrade_avg;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CornGradeView [member_id=" + member_id + ", corngrade_avg=" + corngrade_avg + "]";
	}
	
	
}
