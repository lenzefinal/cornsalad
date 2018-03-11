package com.devone.finalp.project_status.model.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.SubCategory;

public interface ProjectStatusService {

	List<Category> selectAllCategory();
	List<SubCategory> selectListSubCategoryByCaId(String categoryId);
	List<Bank> selectAllBank();
}
