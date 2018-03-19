package com.devone.finalp.pdetail.model.service;

import java.util.ArrayList;
import java.util.List;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.vo.HotListView;



public interface DetailViewService {

	List<HotListView> selectHotList();
	
	int insertReport(Report report);
	
	int selectLikes(String project_id);
	
	Likes existList(Likes likes);
	
}
