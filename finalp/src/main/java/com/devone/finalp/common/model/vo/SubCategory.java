package com.devone.finalp.common.model.vo;

public class SubCategory implements java.io.Serializable{

	private static final long serialVersionUID = 4145175084597286720L;
	private String category_sub_id;
	private String category_sub_name;
	private String category_id;
	
	public SubCategory() {}

	public SubCategory(String category_sub_id, String category_sub_name, String category_id) {
		super();
		this.category_sub_id = category_sub_id;
		this.category_sub_name = category_sub_name;
		this.category_id = category_id;
	}

	public String getCategory_sub_id() {
		return category_sub_id;
	}

	public void setCategory_sub_id(String category_sub_id) {
		this.category_sub_id = category_sub_id;
	}

	public String getCategory_sub_name() {
		return category_sub_name;
	}

	public void setCategory_sub_name(String category_sub_name) {
		this.category_sub_name = category_sub_name;
	}

	public String getCategory_id() {
		return category_id;
	}

	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SubCategory [category_sub_id=" + category_sub_id + ", category_sub_name=" + category_sub_name
				+ ", category_id=" + category_id + "]";
	}
	
	
}
