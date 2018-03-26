package com.devone.finalp.project_list.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.project_list.model.dao.ProjectListDao;
import com.devone.finalp.project_list.model.vo.ProductListView;
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
	public List<ProductListView> selectProductList(){
		return projectListDao.selectProductList();
	}
	
	@Override
	public List<ProjectListView> selectEndProject() {
		return projectListDao.selectEndProject();
	}
	
	@Override
	public List<ProductListView> selectEndProduct(){
		return projectListDao.selectEndProduct();
	}
	

	//----------------------------공동구매----------------------------------------
	@Override
	public List<ProductListView> selectProductListKeyword(String project_name) {
		return projectListDao.selectProductListKeyword(project_name);
	}

	@Override
	public List<ProductListView> selectProductListCategory(List<String> category) {
		return projectListDao.selectProductListCategory(category);
	}

	@Override
	public List<ProductListView> selectProductKeywordCategory(List<String> category, String project_name) {
		return projectListDao.selectProductKeywordCategory(category, project_name);
	}
	
	//--------------------------------펀딩프로젝트------------------------------------
	@Override
	public List<ProjectListView> selectProjectListKeyword(String project_name) {
		return projectListDao.selectProjectListKeyword(project_name);
	}

	@Override
	public List<ProjectListView> selectProjectListCategory(List<String> category) {
		return projectListDao.selectProjectListCategory(category);
	}

	@Override
	public List<ProjectListView> selectKeywordCategory(List<String> category, String project_name) {
		return projectListDao.selectKeywordCategory(category, project_name);
	}

	@Override
	public List<ProjectListView> selectEndProjectList() {
		return projectListDao.selectEndProjectList();
	}

	@Override
	public List<ProductListView> selectEndProductList() {
		return projectListDao.selectEndProductList();
	}

}
