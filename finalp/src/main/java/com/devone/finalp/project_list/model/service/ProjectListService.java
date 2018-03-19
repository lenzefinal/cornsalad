package com.devone.finalp.project_list.model.service;

import java.util.List;

import com.devone.finalp.project_list.model.vo.ProjectListView;

public interface ProjectListService {
	List<ProjectListView> selectProjectList();
}
