package com.devone.finalp.project_list.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.project_list.model.vo.ProductListView;
import com.devone.finalp.project_list.model.vo.ProjectListView;

@Repository("projectListDao")
public class ProjectListDao {
	
	@Autowired
	private SqlSession mybatis;
	
	public List<ProjectListView> selectProjectList(){
		return mybatis.selectList("projectListMapper.selectProjectList");
	}
	
	public List<ProductListView> selectProductList(){
		return mybatis.selectList("projectListMapper.selectProductList");
	}


	//-----------------------------펀딩프로젝트 검색---------------------------------
	public List<ProjectListView> selectProjectListKeyword(String project_name) {
		// TODO Auto-generated method stub
		String keyword="%"+project_name+"%";
		return mybatis.selectList("projectListMapper.selectProjectListKeyword", keyword);
	}
	
	public List<ProjectListView> selectProjectListCategory(List<String> category){
		
		HashMap<String, List<String>> hm = new HashMap<String, List<String>>();
		hm.put("category_sub_id", category);
	
		
		return mybatis.selectList("projectListMapper.selectProjectListCategory", hm);
	}
	
	public List<ProjectListView> selectKeywordCategory(List<String> category, String project_name){
		HashMap hm = new HashMap();
		hm.put("project_name", "%"+project_name+"%");
		hm.put("category_sub_id", category);
		
		return mybatis.selectList("projectListMapper.selectKeywordCategory", hm);
	}
	
	
	//-----------------------------공동구매 검색---------------------------------
	public List<ProductListView> selectProductListKeyword(String project_name) {
		// TODO Auto-generated method stub
		String keyword="%"+project_name+"%";
		return mybatis.selectList("projectListMapper.selectProductListKeyword", keyword);
	}
	
	public List<ProductListView> selectProductListCategory(List<String> category){
		
		HashMap<String, List<String>> hm = new HashMap<String, List<String>>();
		hm.put("category_sub_id", category);
	
		
		return mybatis.selectList("projectListMapper.selectProductListCategory", hm);
	}
	
	public List<ProductListView> selectProductKeywordCategory(List<String> category, String project_name){
		HashMap hm = new HashMap();
		hm.put("project_name", "%"+project_name+"%");
		hm.put("category_sub_id", category);
		
		return mybatis.selectList("projectListMapper.selectProductKeywordCategory", hm);
	}

	public List<ProjectListView> selectEndProjectList() {
		return mybatis.selectList("projectListMapper.selectEndProjectList");
	}

	public List<ProductListView> selectEndProductList() {
		return mybatis.selectList("projectListMapper.selectEndProductList");
	}

}
