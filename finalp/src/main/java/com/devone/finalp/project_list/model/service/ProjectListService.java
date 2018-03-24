package com.devone.finalp.project_list.model.service;

import java.util.List;

import com.devone.finalp.project_list.model.vo.ProductListView;
import com.devone.finalp.project_list.model.vo.ProjectListView;

public interface ProjectListService {
	List<ProjectListView> selectProjectList();
	List<ProductListView> selectProductList();

	List<ProjectListView> selectProjectListKeyword(String project_name);
	List<ProjectListView> selectProjectListCategory(List<String> category);
	List<ProjectListView> selectKeywordCategory(List<String> category, String project_name);
	
	List<ProductListView> selectProductListKeyword(String project_name);
	List<ProductListView> selectProductListCategory(List<String> category);
	List<ProductListView> selectProductKeywordCategory(List<String> category, String project_name);
}
