package com.devone.finalp.common.model.vo;

public class Item implements java.io.Serializable{

	private static final long serialVersionUID = 4346277178367854739L;
	private String item_id;
	private String item_name;
	private String project_id;
	
	public Item() {}
	
	public Item(String item_id, String item_name, String project_id) {
		super();
		this.item_id = item_id;
		this.item_name = item_name;
		this.project_id = project_id;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Item [item_id=" + item_id + ", item_name=" + item_name + ", project_id=" + project_id + "]";
	}
	
	
}
