package com.devone.finalp.project_list.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.project_list.model.dao.ProjectListDao;
import com.devone.finalp.project_list.model.vo.ProjectListView;

@Service("projectListService")
public class ProjectListServiceImpl implements ProjectListService{

	@Autowired
	private ProjectListDao projectListDao;
	
	@Override
	public List<ProjectListView> selectProjectList() {
		return projectListDao.selectProjectList();
	}

}
