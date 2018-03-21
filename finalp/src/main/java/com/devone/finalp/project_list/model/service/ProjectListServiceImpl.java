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

	@Override
	public List<ProjectListView> selectProjectListKeyword(ProjectListView project) {
		return projectListDao.selectProjectListKeyword(project);
	}

	@Override
	public List<ProjectListView> selectProjectListCategory(List<String> category) {
		return projectListDao.selectProjectListCategory(category);
	}

	@Override
	public List<ProjectListView> selectKeywordCategory(List<String> category, String project_name) {
		return projectListDao.selectKeywordCategory(category, project_name);
	}

}
