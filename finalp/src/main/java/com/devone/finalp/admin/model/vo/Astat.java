package com.devone.finalp.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Astat implements java.io.Serializable {
	
	private static final long serialVersionUID = 1933700088183767725L;

	private int fundcount;
	private int prodcount;
	private int rnum;
	private int money;
	private String project_id;
	private String project_name;
	private String project_category_name;
	private int ranum;
	private int spon;
	private String member_id;
	private String member_name;
	
	public Astat() {}

	public Astat(int fundcount, int prodcount, int rnum, int money, String project_id, String project_name,
			String project_category_name, int ranum, int spon, String member_id, String member_name) {
		super();
		this.fundcount = fundcount;
		this.prodcount = prodcount;
		this.rnum = rnum;
		this.money = money;
		this.project_id = project_id;
		this.project_name = project_name;
		this.project_category_name = project_category_name;
		this.ranum = ranum;
		this.spon = spon;
		this.member_id = member_id;
		this.member_name = member_name;
	}

	public int getFundcount() {
		return fundcount;
	}

	public void setFundcount(int fundcount) {
		this.fundcount = fundcount;
	}

	public int getProdcount() {
		return prodcount;
	}

	public void setProdcount(int prodcount) {
		this.prodcount = prodcount;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProject_category_name() {
		return project_category_name;
	}

	public void setProject_category_name(String project_category_name) {
		this.project_category_name = project_category_name;
	}

	public int getRanum() {
		return ranum;
	}

	public void setRanum(int ranum) {
		this.ranum = ranum;
	}

	public int getSpon() {
		return spon;
	}

	public void setSpon(int spon) {
		this.spon = spon;
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

	@Override
	public String toString() {
		return "Astat [fundcount=" + fundcount + ", prodcount=" + prodcount + ", rnum=" + rnum + ", money=" + money
				+ ", project_id=" + project_id + ", project_name=" + project_name + ", project_category_name="
				+ project_category_name + ", ranum=" + ranum + ", spon=" + spon + ", member_id=" + member_id
				+ ", member_name=" + member_name + "]";
	}
	
	
}
