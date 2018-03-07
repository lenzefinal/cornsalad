package com.devone.finalp.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MypageController {
	
	@RequestMapping("mypageIndex.do")
	public String mypageIndex() {
		System.out.println("마이페이지 인덱스");
		
		return "mypage/mypageIndex";
	}
	
	@RequestMapping("mypageModify.do")
	public String mypageModify() {
		System.out.println("정보 수정 폼");
		
		return "mypage/mypageModify";
	}
	
	@RequestMapping("mypageWithdrawal.do")
	public String mypageWithdrawal() {
		System.out.println("회원 탈퇴 폼");
		
		return "mypage/mypageWithdrawal";
	}
}
