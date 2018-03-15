package com.devone.finalp.pdetail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devone.finalp.pdetail.model.service.DetailViewServiceImpl;

@Controller
public class DetailViewController {

	@Autowired
	private DetailViewServiceImpl detailviewService;
	
	@RequestMapping("selectHotList.do")
	public String selectHotList(Model model) {
		System.out.println("잘들어왓나");
		
		model.addAttribute("hotlist", detailviewService.selectHotList());
		
		return "project/projectDetailView";
	}
}
