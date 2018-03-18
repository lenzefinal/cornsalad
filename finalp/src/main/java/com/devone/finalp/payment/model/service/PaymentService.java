package com.devone.finalp.payment.model.service;

import java.util.List;

import com.devone.finalp.payment.model.vo.GiftItem;
import com.devone.finalp.payment.model.vo.PayGiftView;
import com.devone.finalp.payment.model.vo.SellerInfo;

public interface PaymentService {
	
	SellerInfo selectProject(String project_id);
	List<PayGiftView> selectAllGift(String project_id);
	List<GiftItem> selectItem();
}
