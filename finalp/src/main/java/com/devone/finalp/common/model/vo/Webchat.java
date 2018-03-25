package com.devone.finalp.common.model.vo;

import java.io.Serializable;


public class Webchat implements Serializable{
	public Webchat() {}
	public final static long serialVersionUID = 5L;
	private String room_id;
	private String room_name;
	private String member_id;
	private String room_reply_id;
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRoom_reply_id() {
		return room_reply_id;
	}
	public void setRoom_reply_id(String room_reply_id) {
		this.room_reply_id = room_reply_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Webchat(String room_id, String room_name, String member_id, String room_reply_id) {
		super();
		this.room_id = room_id;
		this.room_name = room_name;
		this.member_id = member_id;
		this.room_reply_id = room_reply_id;
	}
	@Override
	public String toString() {
		return "Webchat [room_id=" + room_id + ", room_name=" + room_name + ", member_id=" + member_id
				+ ", room_reply_id=" + room_reply_id + "]";
	}
	
	
	
	
}
