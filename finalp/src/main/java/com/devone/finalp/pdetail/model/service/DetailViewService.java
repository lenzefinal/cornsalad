package com.devone.finalp.pdetail.model.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.ProjectReply;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.Report;
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



public interface DetailViewService {

	List<HotListView> selectHotList();
	
	int insertReport(Report report);
	
	int selectLikes(String project_id);
	
	Likes existList(Likes likes);
	
	int insertQuestion(Question question);
	
	List<GiftView> selectGiftList(String project_id);
	
	ProjectView selectProView(String project_id);
	
	LoginTimeView selectloginTime(LoginTimeView loginTime);
	
	int selectcount(String member_id);
	
	List<SuppoterView> selectSuppoterList(String project_id);
	
	List<GiftListView> selectGlist(String project_id);
	
	
	List<ReplyView> selectReplyList(String project_id);
	
	int insertReplyZero(ProjectReply projectreply);
	int insertReplyOne(ProjectReply projectreply);
	
	ProjectView selectGPView(String project_id);
	List<ProductDetailView> selectListProductView(String project_id);
	CornGradeView selectOneCornGradeView(String member_id);
	
}
