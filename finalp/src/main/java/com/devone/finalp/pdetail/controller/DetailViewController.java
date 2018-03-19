package com.devone.finalp.pdetail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.service.DetailViewServiceImpl;
import com.devone.finalp.pdetail.model.vo.GiftView;
import com.devone.finalp.pdetail.model.vo.HotListView;

@Controller
public class DetailViewController {

	@Autowired
	private DetailViewServiceImpl detailviewService;
	
	@RequestMapping("projectDetailView.do")
	public String projectDetailView(Model model,@RequestParam("project_id") String project_id) {
		System.out.println("잘들어왓나");
		List<HotListView> list = detailviewService.selectHotList();
		//List<lGiftView> ist1=detailviewService.selectGiftList("15210212364391");
		int like=detailviewService.selectLikes(project_id);
		model.addAttribute("hotlist", list);
//		model.addAttribute("giftlist", list1); 
		
		return "project/projectDetailView";
	}
	
	@RequestMapping(value="reportProject.do", method=RequestMethod.POST)
		
	public void reportProject(Report report) {
	
		System.out.println("신고하기" + report);
		int result=detailviewService.insertReport(report);
		
		
	}
}
