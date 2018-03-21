package com.devone.finalp.pdetail.model.service;

import java.util.ArrayList;
import java.util.List;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.vo.HotListView;
import com.devone.finalp.pdetail.model.vo.LoginTimeView;
import com.devone.finalp.pdetail.model.vo.ProjectView;



public interface DetailViewService {

	List<HotListView> selectHotList();
	
	int insertReport(Report report);
	
	int selectLikes(String project_id);
	
	Likes existList(Likes likes);
	
	int insertQuestion(Question question);
	
	ProjectView selectProView(String project_id);
	
	LoginTimeView selectloginTime(LoginTimeView loginTime);
	
	int selectcount(String member_id);
}
