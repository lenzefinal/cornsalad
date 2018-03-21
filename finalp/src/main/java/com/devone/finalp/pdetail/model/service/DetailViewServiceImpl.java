package com.devone.finalp.pdetail.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.dao.DetailViewDao;
import com.devone.finalp.pdetail.model.vo.GiftView;
import com.devone.finalp.pdetail.model.vo.HotListView;

@Service("detailviewService")
public class DetailViewServiceImpl implements DetailViewService{

	@Autowired
	private DetailViewDao detailviewDao;
	
	@Override
	public List<HotListView> selectHotList() {
		
		return detailviewDao.selectHotList();
	}
	public List<GiftView> selectGiftList(String Project_id){
		
		return detailviewDao.selectGiftList(Project_id);
	}

	public int insertReport(Report report) {
		return detailviewDao.insertReport(report);
		
	}
	public int selectLikes(String project_id) {
		
		return detailviewDao.selectLikes(project_id);
	}
	@Override
	public Likes existList(Likes likes) {
		
		return detailviewDao.existLike(likes);
	}
	public int addLike(Likes likes) {
		return detailviewDao.addLikes(likes);
	}
	public int deleteLike(Likes likes) {
		return detailviewDao.deleteLike(likes);
	}
	public int insertQuestion(Question question) {
		return detailviewDao.insertQuestion(question);
		
	}

	
}
