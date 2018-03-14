package com.devone.finalp.project_status.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Gift;
import com.devone.finalp.common.model.vo.GiftInItems;
import com.devone.finalp.common.model.vo.Item;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.ProjectAccount;
import com.devone.finalp.common.model.vo.ProjectContent;
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

	public int updateProjectContent(ProjectContent projectCon) {
		return mybatis.update("projectstatusMapper.updateProjectContent", projectCon);
	}

	public int insertProjectContent(ProjectContent projectCon) {
		return mybatis.insert("projectstatusMapper.insertProjectContent", projectCon);
	}

	public int insertProjectAccount(ProjectAccount projectAcc) {
		return mybatis.insert("projectstatusMapper.insertProjectAccount", projectAcc);
	}

	public int insertGift(Gift gift) {
		return mybatis.insert("projectstatusMapper.insertGift", gift);
	}

	public int insertItem(Item item) {
		return mybatis.insert("projectstatusMapper.insertItem", item);
	}

	public int insertGiftInItem(GiftInItems giftInItem) {
		return mybatis.insert("projectstatusMapper.insertGiftInItem", giftInItem);
	}

	public ProjectContent selectOneProjectContentByProId(String projectId) {
		return mybatis.selectOne("projectstatusMapper.selectOneProjectContent", projectId);
	}

	public ProjectAccount selectOneProjectAccountByProId(String projectId) {
		return mybatis.selectOne("projectstatusMapper.selectOneProjectAccount", projectId);
	}

	public List<Item> selectListItem(String projectId) {
		return mybatis.selectList("projectstatusMapper.selectListItem", projectId);
	}

	public List<Gift> selectListGift(String projectId) {
		return mybatis.selectList("projectstatusMapper.selectListGift", projectId);
	}

	public List<GiftInItems> selectListGiftInItems(String projectId) {
		return mybatis.selectList("projectstatusMapper.selectListGiftInItems", projectId);
	}
}
