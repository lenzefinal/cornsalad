package com.devone.finalp.project_status.model.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Gift;
import com.devone.finalp.common.model.vo.GiftInItems;
import com.devone.finalp.common.model.vo.Item;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.ProjectAccount;
import com.devone.finalp.common.model.vo.ProjectContent;
import com.devone.finalp.common.model.vo.SubCategory;

public interface ProjectStatusService {

	List<Category> selectAllCategory();
	List<SubCategory> selectListSubCategoryByCaId(String categoryId);
	List<Bank> selectAllBank();
	int insertProject(Project project);
	Project selectOneProjectByProId(String project_id);
	void updateProjectToUploadImg(Project project);
	int selectProjectIdSeqNextval();
	int updateProject(Project project);
	int updateProjectContent(ProjectContent projectCon);
	int insertProjectContent(ProjectContent projectCon);
	int insertProjectAccount(ProjectAccount projectAcc);
	int insertGift(Gift gift);
	int insertItem(Item item);
	int insertGiftInItem(GiftInItems giftInItem);
	ProjectContent selectOneProjectContentByProId(String projectId);
	ProjectAccount selectOneProjectAccountByProId(String projectId);
	List<Item> selectListItem(String projectId);
	List<Gift> selectListGift(String projectId);
	List<GiftInItems> selectListGiftInItems(String projectId);
}
