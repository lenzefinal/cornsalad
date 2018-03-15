package com.devone.finalp.pdetail.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.pdetail.model.dao.DetailViewDao;

@Service("detailviewService")
public class DetailViewServiceImpl implements DetailViewService{

	@Autowired
	private DetailViewDao detailviewDao;
	
	@Override
	public List<Likes> selectHotList() {
		
		return detailviewDao.selectHotList();
	}

	
}
