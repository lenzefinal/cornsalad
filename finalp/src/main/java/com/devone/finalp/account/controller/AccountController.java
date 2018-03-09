package com.devone.finalp.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {

	@RequestMapping("account.do")
	public String accountMethod() {
		return "account/account";
	}
	
	@RequestMapping("account2.do")
	public String accountMethod2() {
		return "account/account2";
	}
	
	@RequestMapping("account3.do")
	public String accountMethod3() {
		return "account/account3";
	}
	
	@RequestMapping("payoption.do")
	public String payOption(String popup) {
		return "account/pay-"+popup;
	}
}
