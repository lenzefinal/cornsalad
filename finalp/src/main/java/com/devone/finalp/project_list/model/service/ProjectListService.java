package com.devone.finalp.project_list.model.service;

import java.util.Collection;
import java.util.List;

import com.devone.finalp.project_list.model.vo.ProjectListView;

public interface ProjectListService {
	List<ProjectListView> selectProjectList();

	List<ProjectListView> selectProjectListKeyword(String project_name);
	List<ProjectListView> selectProjectListCategory(List<String> category);
	List<ProjectListView> selectKeywordCategory(List<String> category, String project_name);
}
