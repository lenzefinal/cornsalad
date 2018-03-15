package com.devone.finalp.project_status.model.vo;

public class GiftInItemsUpdate implements java.io.Serializable {

	private static final long serialVersionUID = 7123878019599210398L;
	private String gift_id;
	private String item_id;
	private int count;
	private String project_id;
	
	public GiftInItemsUpdate() {}

	public GiftInItemsUpdate(String gift_id, String item_id, int count, String project_id) {
		super();
		this.gift_id = gift_id;
		this.item_id = item_id;
		this.count = count;
		this.project_id = project_id;
	}

	public String getGift_id() {
		return gift_id;
	}

	public void setGift_id(String gift_id) {
		this.gift_id = gift_id;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
		return "GiftInItemsUpdate [gift_id=" + gift_id + ", item_id=" + item_id + ", count=" + count + ", project_id="
				+ project_id + "]";
	}
	
	

}
