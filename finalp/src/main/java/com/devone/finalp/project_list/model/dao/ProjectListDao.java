package com.devone.finalp.project_list.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.project_list.model.vo.ProjectListView;

@Repository("projectListDao")
public class ProjectListDao {
	
	@Autowired
	private SqlSession mybatis;
	
	public List<ProjectListView> selectProjectList(){
		return mybatis.selectList("projectListMapper.selectProjectList");
	}

}
