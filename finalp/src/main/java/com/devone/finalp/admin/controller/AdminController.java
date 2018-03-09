package com.devone.finalp.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	// 관리자테스트
	@RequestMapping("adminMain.do")
	public String adminMain() {
		return "admin/adminIndex";
	}

	@RequestMapping("adminMember.do")
	public String adminMember() {
		return "admin/adminMember";
	}
	
	@RequestMapping("adminMemberDetail.do")
	public String adminMemberDetail() {
		return "admin/adminMemberDetail";
	}

	@RequestMapping("adminProject.do")
	public String adminProject() {
		return "admin/adminProject";
	}

	@RequestMapping("adminNotice.do")
	public String adminNotice() {
		return "admin/adminNotice";
	}

	@RequestMapping("adminQuestion.do")
	public String adminQuestion() {
		return "admin/adminQuestion";
	}

	@RequestMapping("adminReport.do")
	public String adminReport() {
		return "admin/adminReport";
	}

	@RequestMapping("adminStat.do")
	public String adminStat() {
		return "admin/adminStat";
	}

}
