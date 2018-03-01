package com.devone.finalp.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devone.finalp.member.model.service.MemberService;
import com.devone.finalp.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String loginMethod(Member member, HttpSession session) {
		
		System.out.println("로그인");
		session.setAttribute("loginUser", memberService.login(member));
		
		return "home";
	}
	
	@RequestMapping("/logout.do")
	public String loginMethod(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		
		return "home";
	}
}
