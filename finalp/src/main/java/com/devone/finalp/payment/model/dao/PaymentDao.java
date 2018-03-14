package com.devone.finalp.payment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Payment;



@Repository("accountDao")
public class PaymentDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertPayment(Payment p) {
		return mybatis.insert("paymentMapper.insertPayment", p);
	}
	
	public int refundPayment(String payment_id) {
		return mybatis.update("paymentMapper.updatePayment", payment_id);
	}
	
}
