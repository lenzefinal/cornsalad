package com.devone.finalp.project_status.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.SubCategory;

@Repository("projectStatusDao")
public class ProjectStatusDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<Category> selectAllCategory() {
		return mybatis.selectList("projectstatusMapper.selectAllCategory");
	}

	public List<SubCategory> selectListSubCategoryByCaId(String categoryId) {
		return mybatis.selectList("projectstatusMapper.selectListSubCategoryByCaId", categoryId);
	}

	public List<Bank> selectAllBank() {
		return mybatis.selectList("projectstatusMapper.selectAllBank");
	}

	public int insertProject(Project project) {
		return mybatis.insert("projectstatusMapper.insertProject", project);
	}

	public Project selectOneProjectByProId(String project_id) {
		return mybatis.selectOne("projectstatusMapper.selectOneProject", project_id);
	}

	public void updateProjectToUploadImg(Project project) {
		mybatis.update("projectstatusMapper.updateProjectToUploadImg", project);
	}

	public int selectProjectIdSeqNextval() {
		return mybatis.selectOne("projectstatusMapper.selectOneProjectIdSeq");
	}

	public int updateProject(Project project) {
		return mybatis.update("projectstatusMapper.updateProject", project);
	}
}
