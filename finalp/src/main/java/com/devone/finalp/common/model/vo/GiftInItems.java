package com.devone.finalp.common.model.vo;

public class GiftInItems implements java.io.Serializable{

	private static final long serialVersionUID = -8608188583854994610L;
	private String gift_id;
	private String item_id;
	private int count;
	
	public GiftInItems() {}
	
	public GiftInItems(String gift_id, String item_id, int count) {
		super();
		this.gift_id = gift_id;
		this.item_id = item_id;
		this.count = count;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "GiftInItems [gift_id=" + gift_id + ", item_id=" + item_id + ", count=" + count + "]";
	}
	
	
}
