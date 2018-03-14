package com.devone.finalp.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devone.finalp.iamport.model.vo.Iamport_class;
import com.siot.IamportRestClient.request.CancelData;

@Controller
public class PaymentController {
	
	@Autowired
	private Iamport_class i ;
	
	

	@RequestMapping("payment.do")
	public String accountMethod() {
		return "payment/payment";
	}
	
	@RequestMapping("payment2.do")
	public String accountMethod2() {
		return "payment/payment2";
	}
	
	@RequestMapping("payment3.do")
	public String accountMethod3() {
		return "payment/payment3";
	}
	
	@RequestMapping("payoption.do")
	public String payOption(String popup) {

		return "payment/pay-"+popup;
	}
	
	@ResponseBody
	@RequestMapping("refund.do")
	public void refund(@RequestParam("imp_id") String imp_id, 
						@RequestParam("imp_secret") String imp_secret,
						@RequestParam("imp_uid") String imp_uid) {
		
		System.out.println(imp_id+", "+imp_secret+", "+imp_uid);
		CancelData cancel_data = new CancelData(imp_uid, true);
		
		i.cancelPaymentByImpUid(cancel_data,imp_id, imp_secret);
		
		
		System.out.println("환불값 가져오기 성공");
	}

	
}
