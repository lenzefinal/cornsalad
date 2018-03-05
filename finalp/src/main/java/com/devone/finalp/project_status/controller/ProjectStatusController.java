package com.devone.finalp.project_status.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectStatusController {

	@RequestMapping("fundingInsertView.do")
	public String fundingInsertViewMethod() {
		return "projectStatus/fundingInsertView";
	}
}
