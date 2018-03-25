package com.devone.finalp.payment.model.vo;

import java.io.Serializable;

public class GiftItem implements Serializable {

	private static final long serialVersionUID = -2484677686979168905L;

	private String gift_id;
	private String item_name;
	private int count;
	
	public GiftItem() {}

	public GiftItem(String gift_id, String item_name, int count) {
		
		this.gift_id = gift_id;
		this.item_name = item_name;
		this.count = count;
		
	}

	public String getGift_id() {
		return gift_id;
	}

	public void setGift_id(String gift_id) {
		this.gift_id = gift_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	

	@Override
	public String toString() {
		return "gift_id : "+gift_id+"/ item_name : "+item_name+"/ count : "+count;
	}
	
}
