package com.devone.finalp.pdetail.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.ProjectReply;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.dao.DetailViewDao;
import com.devone.finalp.pdetail.model.vo.CornGradeView;
import com.devone.finalp.pdetail.model.vo.GiftListView;
import com.devone.finalp.pdetail.model.vo.GiftView;
import com.devone.finalp.pdetail.model.vo.HotListView;
import com.devone.finalp.pdetail.model.vo.LoginTimeView;
import com.devone.finalp.pdetail.model.vo.ProductDetailView;
//import com.devone.finalp.pdetail.model.vo.ProductDetailView;
import com.devone.finalp.pdetail.model.vo.ProjectView;
import com.devone.finalp.pdetail.model.vo.ReplyView;
import com.devone.finalp.pdetail.model.vo.SuppoterView;

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
	
	public int insertReplyReport(Report report) {
		return detailviewDao.insertReplyReport(report);
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
	public ProjectView selectProView(String project_id) {
		return detailviewDao.selectProView(project_id);
	}
	public LoginTimeView selectloginTime(LoginTimeView loginTime) {
		
		return detailviewDao.selectloginTime(loginTime);
	}
	public Project selectMemberId(String project_id) {
		
		return detailviewDao.selectMemberId(project_id);
	}
	public int selectcount(String member_id) {
		
		return detailviewDao.selectcount(member_id);
	}
	public List<SuppoterView> selectSuppoterList(String project_id) {
		
		return detailviewDao.selectSuppoterList(project_id);
	}
	public List<GiftListView> selectGlist(String project_id) {
		
		return detailviewDao.selectGlist(project_id);
	}
	@Override
	public List<ReplyView> selectReplyList(String project_id) {
		return detailviewDao.selectReplyList(project_id);
	}
	@Override
	public int insertReplyZero(ProjectReply projectreply) {
		return detailviewDao.insertReplyZero(projectreply);
	}
	@Override
	public int insertReplyOne(ProjectReply projectreply) {
		return detailviewDao.insertReplyOne(projectreply);
	}
	@Override
	public ProjectView selectGPView(String project_id) {
		return detailviewDao.selectGPView(project_id);
	}
	@Override
	public List<ProductDetailView> selectListProductView(String project_id) {
		return detailviewDao.selectListProductView(project_id);
	}
	
	public int addReportCount(Project project) {
		
		return detailviewDao.addReportCount(project);
		
	}
	
	@Override
	public CornGradeView selectOneCornGradeView(String member_id) {
		return detailviewDao.selectOneCornGradeView(member_id);
	}
	
	
}
