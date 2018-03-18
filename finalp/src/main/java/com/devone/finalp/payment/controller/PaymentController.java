package com.devone.finalp.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.devone.finalp.iamport.model.vo.Iamport_class;
import com.devone.finalp.payment.model.service.PaymentService;
import com.siot.IamportRestClient.request.CancelData;

@Controller
public class PaymentController {
	
	@Autowired
	private Iamport_class i ;
	
	@Autowired
	private PaymentService payService;
	
	@RequestMapping("test.do")
	public String test() {
		return "payment/test-page";
	}
	
	@RequestMapping("payment.do")
	public String openPayment(@RequestParam("p_id") String project_id,
								@RequestParam("g_id") String gift_id,
								Model model) {
		System.out.println("p_id : "+project_id+" g_id : "+gift_id);
		
		model.addAttribute("P", payService.selectProject(project_id));
		model.addAttribute("glist", payService.selectAllGift(project_id));
		model.addAttribute("ilist",payService.selectItem());
		model.addAttribute("gift_id", gift_id);
		
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
