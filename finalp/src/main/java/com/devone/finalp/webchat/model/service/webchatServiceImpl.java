package com.devone.finalp.webchat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Webchat;
import com.devone.finalp.webchat.model.dao.webchatDao;

@Service("wService")
public class webchatServiceImpl implements webchatService{
	@Autowired
	private webchatDao wDao;

	@Override
	public List<Webchat> selectWCList() {
		return wDao.selectWCList();
	}

	@Override
	public int updateWC(String room_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteWC(String room_id) {
		return wDao.deleteWC(room_id);
	}

	@Override
	public int insertWC(Webchat wc) {
		return wDao.insertWC(wc);
	}

	@Override
	public Webchat searchWC(String room_id) {
		return wDao.searchWC(room_id);
	}

	
}
