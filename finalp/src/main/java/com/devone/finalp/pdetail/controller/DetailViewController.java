package com.devone.finalp.pdetail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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
import com.devone.finalp.common.model.vo.ProjectReply;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.service.DetailViewServiceImpl;
import com.devone.finalp.pdetail.model.vo.CornGradeView;
import com.devone.finalp.pdetail.model.vo.GiftListView;
import com.devone.finalp.pdetail.model.vo.GiftView;
import com.devone.finalp.pdetail.model.vo.HotListView;
import com.devone.finalp.pdetail.model.vo.LoginTimeView;
import com.devone.finalp.pdetail.model.vo.ProductDetailView;
import com.devone.finalp.pdetail.model.vo.ProjectView;
import com.devone.finalp.pdetail.model.vo.ReplyView;
import com.devone.finalp.pdetail.model.vo.SuppoterView;

@Controller
public class DetailViewController {

	@Autowired
	private DetailViewServiceImpl detailviewService;
	
	@RequestMapping("projectDetailView.do")
	public String projectDetailView(Model model,@RequestParam("project_id") String project_id,
									@RequestParam("member_id") String member_id,
									Likes likes,LoginTimeView loginTime) {
		
		System.out.println(member_id);
		System.out.println(project_id);
		
		List<HotListView> list = detailviewService.selectHotList();
		
//      판매자 member_id 알아옴
		Project project=detailviewService.selectMemberId(project_id);
		
		System.out.println(project);
		
//		프로젝트에 대한 후원자들 리스트 
		List<SuppoterView> suppoter=detailviewService.selectSuppoterList(project_id);
		
		ProjectView proview=detailviewService.selectProView(project_id);
		int like=detailviewService.selectLikes(project_id);
		likes=detailviewService.existList(likes);
//		판매자의 로그인 시간 알아옴
		loginTime.setMember_id(project.getMember_id());
//		프로젝트 아이디에 있는 giftList받아옴
		List<GiftListView> glist=detailviewService.selectGlist(project_id);
//      프로젝트 아이디에 있는 전체 아이템 리스트 받아옴
		List<GiftView> giftlist=detailviewService.selectGiftList(project_id);
		
		//jieun추가
		//콘 지수
		CornGradeView cornGrade = detailviewService.selectOneCornGradeView(project.getMember_id());
		
		System.out.println(suppoter);
		
		boolean suppoterFlag = false;
		if(member_id.equals(project.getMember_id())) {
			suppoterFlag=true;
		}else {
			for(int i=0; i<suppoter.size(); i++) {
				//getMember_id가 null일 때 문제가 발생함
				String suppoterId = suppoter.get(i).getMember_id();
				if(suppoterId != null && suppoterId.equals(member_id)) { 
					suppoterFlag = true;
					break;
				}
			}
		}

		
		LoginTimeView logintime=detailviewService.selectloginTime(loginTime);
//      진행한 프로젝트 갯수 알아오기
		int count =detailviewService.selectcount(project.getMember_id());
		
		model.addAttribute("LoginTimeView", logintime);
		model.addAttribute("proview", proview);
		model.addAttribute("hotlist", list);
		model.addAttribute("glist", glist); 
		model.addAttribute("giftlist", giftlist);
		model.addAttribute("replylist", detailviewService.selectReplyList(project_id));
		model.addAttribute("suppoterFlag", suppoterFlag);
		model.addAttribute("like", like);
		model.addAttribute("likes", likes);	
		model.addAttribute("count", count);
		model.addAttribute("SuppoterView", suppoter);
		model.addAttribute("cornGrade", cornGrade);
		
		return "project/projectDetailView";
	}
	
	@RequestMapping(value="reportProject.do", method=RequestMethod.POST)
	public String reportProject(Report report,Model model) {
	
		System.out.println("신고하기" + report);
		int result=detailviewService.insertReport(report);

		if(result>0) {
			System.out.println("성공");
			Project project=detailviewService.selectMemberId(report.getProject_id());
			System.out.println("이용환"+project);
			detailviewService.addReportCount(project);
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
		
		return job.toJSONString();
	}
	@RequestMapping(value="insertQuestion", method=RequestMethod.POST)
	public String insertQuestion(Question question,@RequestParam("project_id") String project_id,Model model) {
		System.out.println(question);
		
		int result=detailviewService.insertQuestion(question);
		
		String str = "";
		if(result>0) {
			System.out.println("성공");
			model.addAttribute("project_id", project_id);
			model.addAttribute("member_id", question.getSend_member_id());
			str= "redirect:projectDetailView.do";
		}
		return str;
	
	}
	
	@RequestMapping(value="insertReplyOne.do", method=RequestMethod.POST)
	public void insertReplyOne(ProjectReply projectreply, HttpServletResponse response) throws IOException {
		int result = detailviewService.insertReplyOne(projectreply);
		System.out.println(projectreply.toString());
		List<ReplyView> list = new ArrayList<ReplyView>();
		
		if(result>0) {
			System.out.println("성공");
			list = detailviewService.selectReplyList(projectreply.getProject_id());
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("replylist", returnReplyList(list));
		
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
		
		
	}
	
	@RequestMapping(value="insertReplyZero.do", method=RequestMethod.POST)
	public void insertReplyZero(ProjectReply projectreply, HttpServletResponse response) throws IOException {
		int result = detailviewService.insertReplyZero(projectreply);
		List<ReplyView> list = new ArrayList<ReplyView>();
		if(result>0) {
			System.out.println("성공");
			list = detailviewService.selectReplyList(projectreply.getProject_id());
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("replylist", returnReplyList(list));
		
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	public JSONArray returnReplyList(List<ReplyView> list) throws UnsupportedEncodingException {
		JSONArray jarr = new JSONArray();
		
		for(ReplyView reply : list) {
			JSONObject job = new JSONObject();
			job.put("project_reply_id", reply.getProject_reply_id());
			job.put("project_id", reply.getProject_id());
			job.put("member_id", reply.getMember_id());
			job.put("member_name", URLEncoder.encode(reply.getMember_name(),"utf-8"));
			job.put("profile_img_rename", URLEncoder.encode(reply.getProfile_img_rename(),"utf-8"));
			job.put("reply_content", URLEncoder.encode(reply.getReply_content(),"utf-8"));
			job.put("reply_level", reply.getReply_level());
			job.put("proj_reply_id_ref", reply.getProj_reply_id_ref());
			job.put("preply_seq", reply.getPreply_seq());
			job.put("creation_date", reply.getCreation_date().toString());
			job.put("report_count", reply.getReport_count());
			
			jarr.add(job);
		}
		
		return jarr;
	}
	
	//----------
	// jieun 
	//----------
	//펀딩 공동구매 servlet 복붙해서 gift부분만 수정
	//공동구매 상세페이지
	@RequestMapping("projectDetailGPView.do")
	public String projectDetailGPViewMethod(Model model,@RequestParam("project_id") String project_id,
									@RequestParam("member_id") String member_id,
									Likes likes,LoginTimeView loginTime) {
		
		System.out.println(member_id);
		System.out.println(project_id);
		
		List<HotListView> list = detailviewService.selectHotList();
		
//      판매자 member_id 알아옴
		Project project=detailviewService.selectMemberId(project_id);
		
//		프로젝트에 대한 후원자들 리스트 
		List<SuppoterView> suppoter=detailviewService.selectSuppoterList(project_id);
		
		ProjectView proview=detailviewService.selectGPView(project_id);
		int like=detailviewService.selectLikes(project_id);
		likes=detailviewService.existList(likes);
//		판매자의 로그인 시간 알아옴
		loginTime.setMember_id(project.getMember_id());
		
		
		
		
		//물품 리스트
		List<ProductDetailView> productList = detailviewService.selectListProductView(project_id);
		

		boolean suppoterFlag = false;
		if(member_id.equals(project.getMember_id())) {
			suppoterFlag=true;
		}else {
			for(int i=0; i<suppoter.size(); i++) {
				String suppoterId = suppoter.get(i).getMember_id();
				if(suppoterId != null && suppoterId.equals(member_id)) { 
					suppoterFlag = true;
					break;
				}
			}
		}

		
		LoginTimeView logintime=detailviewService.selectloginTime(loginTime);
//      진행한 프로젝트 갯수 알아오기
		int count =detailviewService.selectcount(project.getMember_id());
		
		model.addAttribute("LoginTimeView", logintime);
		model.addAttribute("proview", proview);
		model.addAttribute("hotlist", list);
		model.addAttribute("productList", productList); 
		model.addAttribute("replylist", detailviewService.selectReplyList(project_id));
		model.addAttribute("suppoterFlag", suppoterFlag);
		model.addAttribute("like", like);
		model.addAttribute("likes", likes);	
		model.addAttribute("count", count);
		model.addAttribute("SuppoterView", suppoter);
		model.addAttribute("SuppoterCount", suppoter.size());
		
		return "project/projectDetailGPView";
	}
	
}
