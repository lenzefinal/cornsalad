package com.devone.finalp.pdetail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.set.SynchronizedSortedSet;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.service.DetailViewServiceImpl;
import com.devone.finalp.pdetail.model.vo.HotListView;
import com.devone.finalp.pdetail.model.vo.LoginTimeView;
import com.devone.finalp.pdetail.model.vo.ProjectView;
import com.devone.finalp.pdetail.model.vo.SuppoterView;

@Controller
public class DetailViewController {

	@Autowired
	private DetailViewServiceImpl detailviewService;
	
	@RequestMapping("projectDetailView.do")
	public String projectDetailView(Model model,@RequestParam("project_id") String project_id,@RequestParam("member_id") String member_id,Likes likes,LoginTimeView loginTime) {
		System.out.println("잘들어왓나");
		System.out.println(project_id);
		List<HotListView> list = detailviewService.selectHotList();
//      판매자 member_id 알아옴
		Project project=detailviewService.selectMemberId(project_id);
//		프로젝트에 대한 후원자들 리스트 
		List<SuppoterView> suppoter=detailviewService.selectSuppoterList(project_id);
		
		ProjectView proview=detailviewService.selectProView(project_id);
		int like=detailviewService.selectLikes(project_id);
		likes=detailviewService.existList(likes);
//		판매자의 로그인 시간 알아옴
		loginTime.setMember_id(project.getMember_id());

		
		LoginTimeView logintime=detailviewService.selectloginTime(loginTime);
//      진행한 프로젝트 갯수 알아오기
		int count =detailviewService.selectcount(project.getMember_id());
		model.addAttribute("LoginTimeView", logintime);
		model.addAttribute("proview", proview);
		model.addAttribute("hotlist", list);
//		model.addAttribute("giftlist", list1); 
		model.addAttribute("like", like);
		model.addAttribute("likes", likes);	
		model.addAttribute("count", count);
		model.addAttribute("SuppoterView", suppoter);
		
		return "project/projectDetailView";
	}
	
	@RequestMapping(value="reportProject.do", method=RequestMethod.POST)
	public String reportProject(Report report,Model model) {
	
		System.out.println("신고하기" + report);
		int result=detailviewService.insertReport(report);
		
		if(result>0) {
			System.out.println("성공");
			model.addAttribute("project_id", report.getProject_id());
			model.addAttribute("member_id", report.getMember_id());
			return "redirect:projectDetailView.do";
		}
		return null;
	}
	
	@RequestMapping(value="Like.do", method=RequestMethod.POST)
	@ResponseBody
	public String Like(Likes likes, HttpServletResponse response) throws IOException {
		
		
		Likes exist=detailviewService.existList(likes);
		String result="";
		
		
		if(exist != null) {
			detailviewService.deleteLike(likes);
			result="delete";
		}
		else if(exist==null) {
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
	@RequestMapping(value="insertQuestion", method=RequestMethod.POST)
	public String insertQuestion(Question question,@RequestParam("project_id") String project_id,Model model) {
		System.out.println(question);
		
		int result=detailviewService.insertQuestion(question);
		
		if(result>0) {
			System.out.println("성공");
			model.addAttribute("project_id", project_id);
			model.addAttribute("member_id", question.getSend_member_id());
			return "redirect:projectDetailView.do";
		}
		return null;
	
	}
	
	
}
