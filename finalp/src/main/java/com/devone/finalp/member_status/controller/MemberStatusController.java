package com.devone.finalp.member_status.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.member_status.model.service.MemberStatusService;

@Controller
public class MemberStatusController {

	@Autowired
	private MemberStatusService memberStatusService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginMethod(Member member, HttpSession session) {
		
		System.out.println("로그인");
		session.setAttribute("loginUser", memberStatusService.login(member));
		
		return "home";
	}
	
	@RequestMapping("/logout.do")
	public String logoutMethod(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		
		return "home";
	}
}
