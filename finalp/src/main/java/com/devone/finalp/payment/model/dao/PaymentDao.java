package com.devone.finalp.payment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Payment;
import com.devone.finalp.payment.model.vo.GiftItem;
import com.devone.finalp.payment.model.vo.PayGiftView;
import com.devone.finalp.payment.model.vo.SellerInfo;



@Repository("payDao")
public class PaymentDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertPayment(Payment p) {
		return mybatis.insert("paymentMapper.insertPayment", p);
	}
	
	public int refundPayment(String payment_id) {
		return mybatis.update("paymentMapper.updatePayment", payment_id);
	}

	public SellerInfo selectProject(String project_id) {
		return mybatis.selectOne("paymentMapper.selctProjectInfo", project_id);
	}

	public List<PayGiftView> selectAllGift(String project_id) {
		
		return mybatis.selectList("paymentMapper.selectAllGift", project_id);
	}

	public List<GiftItem> selectItems() {
		
		return mybatis.selectList("paymentMapper.selectItems");
	}
	
}
