package com.devone.finalp.project_status.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.SubCategory;
import com.devone.finalp.project_status.model.dao.ProjectStatusDao;

@Service("projectStatusService")
public class ProjectStatusServiceImpl implements ProjectStatusService {
	
	@Autowired
	private ProjectStatusDao projectStatusDao;

	@Override
	public List<Category> selectAllCategory() {
		return projectStatusDao.selectAllCategory();
	}

	@Override
	public List<SubCategory> selectListSubCategoryByCaId(String categoryId) {
		return projectStatusDao.selectListSubCategoryByCaId(categoryId);
	}

	@Override
	public List<Bank> selectAllBank() {
		return projectStatusDao.selectAllBank();
	}

	@Override
	public int insertProject(Project project) {
		return projectStatusDao.insertProject(project);
	}

	@Override
	public Project selectOneProjectByProId(String project_id) {
		return projectStatusDao.selectOneProjectByProId(project_id);
	}

	@Override
	public void updateProjectToUploadImg(Project project) {
		projectStatusDao.updateProjectToUploadImg(project);
	}

	@Override
	public int selectProjectIdSeqNextval() {
		return projectStatusDao.selectProjectIdSeqNextval();
	}

	@Override
	public int updateProject(Project project) {
		return projectStatusDao.updateProject(project);
	}

}
