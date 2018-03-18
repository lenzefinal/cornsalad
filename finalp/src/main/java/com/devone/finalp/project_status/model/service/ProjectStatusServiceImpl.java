package com.devone.finalp.project_status.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Gift;
import com.devone.finalp.common.model.vo.GiftInItems;
import com.devone.finalp.common.model.vo.Item;
import com.devone.finalp.common.model.vo.Product;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.ProjectAccount;
import com.devone.finalp.common.model.vo.ProjectContent;
import com.devone.finalp.common.model.vo.SubCategory;
import com.devone.finalp.project_status.model.dao.ProjectStatusDao;
import com.devone.finalp.project_status.model.vo.GiftInItemsUpdate;
import com.devone.finalp.project_status.model.vo.ProjectStatusUpdate;

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

	@Override
	public int updateProjectContent(ProjectContent projectCon) {
		return projectStatusDao.updateProjectContent(projectCon);
	}

	@Override
	public int insertProjectContent(ProjectContent projectCon) {
		return projectStatusDao.insertProjectContent(projectCon);
	}

	@Override
	public int insertProjectAccount(ProjectAccount projectAcc) {
		return projectStatusDao.insertProjectAccount(projectAcc);
	}

	@Override
	public int insertGift(Gift gift) {
		return projectStatusDao.insertGift(gift);
	}

	@Override
	public int insertItem(Item item) {
		return projectStatusDao.insertItem(item);
	}

	@Override
	public int insertGiftInItem(GiftInItems giftInItem) {
		return projectStatusDao.insertGiftInItem(giftInItem);
	}

	@Override
	public ProjectContent selectOneProjectContentByProId(String projectId) {
		return projectStatusDao.selectOneProjectContentByProId(projectId);
	}

	@Override
	public ProjectAccount selectOneProjectAccountByProId(String projectId) {
		return projectStatusDao.selectOneProjectAccountByProId(projectId);
	}

	@Override
	public List<Item> selectListItem(String projectId) {
		return projectStatusDao.selectListItem(projectId);
	}

	@Override
	public List<Gift> selectListGift(String projectId) {
		return projectStatusDao.selectListGift(projectId);
	}

	@Override
	public List<GiftInItems> selectListGiftInItems(String projectId) {
		return projectStatusDao.selectListGiftInItems(projectId);
	}

	@Override
	public ProjectStatusUpdate selectOneProjectStatusUpdateByProId(String projectId) {
		return projectStatusDao.selectOneProjectStatusUpdateByProId(projectId);
	}

	@Override
	public List<GiftInItemsUpdate> selectListGiftInItemsUpdate(String projectId) {
		return projectStatusDao.selectListGiftInItemsUpdate(projectId);
	}

	@Override
	public int updateProjectAccount(ProjectAccount projectAcc) {
		return projectStatusDao.updateProjectAccount(projectAcc);
	}

	@Override
	public int deleteGift(String projectId) {
		return projectStatusDao.deleteGift(projectId);
	}

	@Override
	public int deleteItem(String projectId) {
		return projectStatusDao.deleteItem(projectId);
	}

	@Override
	public int insertProduct(Product product) {
		return projectStatusDao.insertProduct(product);
	}

}
