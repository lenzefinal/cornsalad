package com.devone.finalp.mypage.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PurchaseProduct implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9078320180141781478L;
	private String project_id;
	private String image_rename;
	private String project_name;
	private String product_name;
	private String member_id;
	private Date end_date;
	private String payment_id;
	private int size;

	public PurchaseProduct() {

	}

	public PurchaseProduct(String project_id, String image_rename, String project_name, String product_name,
			String member_id, Date end_date, String payment_id, int size) {
		super();
		this.project_id = project_id;
		this.image_rename = image_rename;
		this.project_name = project_name;
		this.product_name = product_name;
		this.member_id = member_id;
		this.end_date = end_date;
		this.payment_id = payment_id;
		this.size = size;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}

	public String getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PurchaseProduct [project_id=" + project_id + ", image_rename=" + image_rename + ", project_name="
				+ project_name + ", product_name=" + product_name + ", member_id=" + member_id + ", end_date="
				+ end_date + ", size=" + size + "]";
	}

}
