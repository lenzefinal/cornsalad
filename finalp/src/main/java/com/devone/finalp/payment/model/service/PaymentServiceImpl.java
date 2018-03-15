package com.devone.finalp.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.payment.model.dao.PaymentDao;
import com.devone.finalp.payment.model.vo.GiftItem;
import com.devone.finalp.payment.model.vo.PayGiftView;
import com.devone.finalp.payment.model.vo.SellerInfo;

@Service("payService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao payDao;

	@Override
	public SellerInfo selectProject(String project_id) {
		return payDao.selectProject(project_id);
	}

	@Override
	public List<PayGiftView> selectAllGift(String project_id) {
		return payDao.selectAllGift(project_id);
	}

	@Override
	public List<GiftItem> selectItem() {
		return payDao.selectItems();
	}

}
