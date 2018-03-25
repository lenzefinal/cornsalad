package com.devone.finalp.board.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Board_recommend implements Serializable{
	public Board_recommend() {}
	public final static long serialVersionUID = 112L;
	private int board_id;
	private String member_id;
	public Board_recommend(int board_id, String member_id) {
		super();
		this.board_id = board_id;
		this.member_id = member_id;
	}
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board_recommend [board_id=" + board_id + ", member_id=" + member_id + "]";
	}
	

}
