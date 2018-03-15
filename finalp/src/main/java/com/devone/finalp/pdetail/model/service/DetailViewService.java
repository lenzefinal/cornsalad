package com.devone.finalp.pdetail.model.service;

import java.util.ArrayList;
import java.util.List;

import com.devone.finalp.common.model.vo.Likes;

public interface DetailViewService {

	List<Likes> selectHotList();
	
}
