package com.devone.finalp.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Gift;
import com.devone.finalp.common.model.vo.Item;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.payment.model.dao.PaymentDao;

@Service("payService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao payDao;

	@Override
	public Project selectProject(String project_id) {
		return payDao.selectProject(project_id);
	}

	@Override
	public List<Gift> selectAllGift(String project_id) {
		return payDao.selectAllGift(project_id);
	}

	@Override
	public List<Item> selectItem(String g_id) {
		return payDao.selectItems(g_id);
	}

}
