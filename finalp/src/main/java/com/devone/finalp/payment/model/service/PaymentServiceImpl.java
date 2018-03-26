package com.devone.finalp.payment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Payment;
import com.devone.finalp.common.model.vo.PaymentCount;
import com.devone.finalp.common.model.vo.Product;
import com.devone.finalp.payment.model.dao.PaymentDao;
import com.devone.finalp.payment.model.vo.GiftItem;
import com.devone.finalp.payment.model.vo.PayGiftView;
import com.devone.finalp.payment.model.vo.SellerInfo;

@Service("payService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao payDao;

	@Override
	public SellerInfo selectProjectInfo(String project_id) {
		return payDao.selectProjectInfo(project_id);
	}

	@Override
	public List<PayGiftView> selectAllGift(String project_id) {
		return payDao.selectAllGift(project_id);
	}

	@Override
	public List<GiftItem> selectItem() {
		return payDao.selectItems();
	}

	@Override
	public int insertPayment(Payment p) {
		
		return payDao.insertPayment(p);
	}

	@Override
	public int updatePayment(String payment_id) {
		
		return payDao.updatePayment(payment_id);
	}

	@Override
	public Member selectMember(String m_id) {
		
		return payDao.selectMember(m_id);
	}

	@Override
	public List<GiftItem> selectChoiceGift(String g_id) {
		
		return payDao.selectChoiceGift(g_id);
	}

	@Override
	public int adminRefund(String project_id) {
		
		return payDao.adminRefund(project_id);
	}

	@Override
	public List<Payment> selectPayment(String project_id) {
		
		return payDao.selectPayment(project_id);
	}

	@Override
	public int insertPaymentCount(PaymentCount pc) {
		
		return payDao.insertPaymentCount(pc);
	}

	@Override
	public List<Product> selectProduct(String project_id) {
		
		return payDao.selectProduct(project_id);
	}

	@Override
	public String selectProjectCategory(String p_id) {
		
		return payDao.selectProjectCategory(p_id);
	}

}
