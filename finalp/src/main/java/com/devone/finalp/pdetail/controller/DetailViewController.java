package com.devone.finalp.pdetail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.service.DetailViewServiceImpl;
import com.devone.finalp.pdetail.model.vo.HotListView;

@Controller
public class DetailViewController {

	@Autowired
	private DetailViewServiceImpl detailviewService;
	
	@RequestMapping("projectDetailView.do")
	public String projectDetailView(Model model,@RequestParam("project_id") String project_id,@RequestParam("member_id") String member_id,Likes likes) {
		System.out.println("잘들어왓나");
		List<HotListView> list = detailviewService.selectHotList();
		//List<lGiftView> ist1=detailviewService.selectGiftList("15210212364391");
		int like=detailviewService.selectLikes(project_id);
		Likes exist=detailviewService.existList(likes);

		
		model.addAttribute("hotlist", list);
//		model.addAttribute("giftlist", list1); 
		model.addAttribute("like", like);
		model.addAttribute("exist", exist);		
		return "project/projectDetailView";
	}
	
	@RequestMapping(value="reportProject.do", method=RequestMethod.POST)
	public void reportProject(Report report) {
	
		System.out.println("신고하기" + report);
		int result=detailviewService.insertReport(report);
	}
	

	
	@RequestMapping(value="Like.do", method=RequestMethod.POST)
	@ResponseBody
	public String Like(Likes likes, HttpServletResponse response) throws IOException {
		
		
		Likes exist=detailviewService.existList(likes);
		String result="";
		
		
		if(exist != null) {
			detailviewService.deleteLike(likes);
			result="delete";
		}else {
			detailviewService.addLike(likes);
			result="add";
		}
		
		int like=detailviewService.selectLikes(likes.getProject_id());
		
		JSONObject job  = new JSONObject();
		job.put("result", result);
		job.put("like", like);
		/*PrintWriter out = response.getWriter();
		
		
		out.append(result);
		out.flush();
		out.close();*/
		
		return job.toJSONString();
	}
	
	
}
