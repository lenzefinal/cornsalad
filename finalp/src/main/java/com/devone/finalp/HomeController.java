package com.devone.finalp;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devone.finalp.project_list.model.service.ProjectListService;
import com.devone.finalp.webchat.model.service.webchatService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ProjectListService projectListService;
	@Autowired
	private webchatService wService;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Model model) {
		
		model.addAttribute("comingEndProject", projectListService.selectEndProjectList());
		model.addAttribute("comingEndProduct", projectListService.selectEndProductList());
		model.addAttribute("wclist", wService.selecthomeList());
		
		return "home";
	}
	
	@RequestMapping("testDI.do")
	public String testDIPage() {
		return "test/testDIPage";
	}
	
	@RequestMapping("testAOP.do")
	public String testAOPPage() {
		return "test/testAOPPage";
	}
	
	@RequestMapping("testAjax.do")
	public String testAjaxPage() {
		return "test/testAjaxPage";
	}
	
}
