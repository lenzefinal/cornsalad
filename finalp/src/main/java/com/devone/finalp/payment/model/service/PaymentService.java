package com.devone.finalp.payment.model.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Payment;
import com.devone.finalp.common.model.vo.PaymentCount;
import com.devone.finalp.common.model.vo.Product;
import com.devone.finalp.payment.model.vo.GiftItem;
import com.devone.finalp.payment.model.vo.PayGiftView;
import com.devone.finalp.payment.model.vo.SellerInfo;

public interface PaymentService {
	
	SellerInfo selectProjectInfo(String project_id);
	List<PayGiftView> selectAllGift(String project_id);
	List<GiftItem> selectItem();
	int insertPayment(Payment p);
	int updatePayment(String payment_id);
	Member selectMember(String m_id);
	List<GiftItem> selectChoiceGift(String g_id);
	int adminRefund(String project_id);
	List<Payment> selectPayment(String project_id);
	int insertPaymentCount(PaymentCount pc);
	List<Product> selectProduct(String project_id);
	String selectProjectCategory(String p_id);
}
