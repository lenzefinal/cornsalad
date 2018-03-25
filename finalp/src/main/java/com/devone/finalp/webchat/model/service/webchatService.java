package com.devone.finalp.webchat.model.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Webchat;


public interface webchatService {
	List<Webchat> selectWCList();
	int updateWC(String room_id);
	int deleteWC(String room_id);
	int insertWC(Webchat wc);
	Webchat searchWC(String room_id);
}
