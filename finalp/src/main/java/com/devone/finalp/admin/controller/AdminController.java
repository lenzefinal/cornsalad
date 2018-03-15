package com.devone.finalp.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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

import com.devone.finalp.admin.model.service.AdminService;
import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
import com.devone.finalp.common.model.vo.Taboo;


@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//관리자 controller
	//관리자 인덱스
	@RequestMapping("adminMain.do")
	public String adminMain(Model model) {
		AAlarm aalarm=new AAlarm();		
		model.addAttribute("aalarm",adminService.adminalarm());
		return "admin/adminIndex";
	}
	//관리자 회원리스트
	@RequestMapping("adminMember.do")
	public String adminMember() {
		return "admin/adminMember";
	}
	//관리자 회원 상세보기
	@RequestMapping("adminMemberDetail.do")
	public String adminMemberDetail() {
		return "admin/adminMemberDetail";
	}
	//관리자 프로젝트리스트
	@RequestMapping("adminProject.do")
	public String adminProject() {
		return "admin/adminProject";
	}

	//관리자 공지사항리스트
	@RequestMapping("adminNotice.do")
	public String adminNotice() {
		return "admin/adminNotice";
	}

	//관리자 문의글리스트
	@RequestMapping("adminQuestion.do")
	public String adminQuestion(Model model) {
		model.addAttribute("qlist",adminService.selectQuestionList());
		return "admin/adminQuestion";
	}
	
	//관리자 문의글답변/상세보기
	@ResponseBody
	@RequestMapping(value="adminQuDetail.do", method=RequestMethod.POST)
	public String adminQuestionDetail(HttpServletResponse response,
			@RequestParam(value = "questionid") int question_id) throws IOException {
		response.setContentType("application/json; charset=utf-8");
		AQuestion question=adminService.aquestionDetail(question_id);
		JSONObject job=new JSONObject();
		job.put("question_id", question.getQuestion_id());
		job.put("question_category_name", URLEncoder.encode(question.getQuestion_category_name(),"utf-8"));
		job.put("receive_member_id", question.getReceive_member_id());
		job.put("send_member_id", question.getSend_member_id());
		job.put("title", URLEncoder.encode(question.getTitle(),"utf-8"));
		job.put("content", URLEncoder.encode(question.getContent(),"utf-8"));
		if(question.getRe_content() != null) {
			job.put("re_content", URLEncoder.encode(question.getRe_content(),"utf-8"));
		}else {
			job.put("re_content", question.getRe_content());
		}
		job.put("send_creation_date", question.getSend_creation_date().toString().trim());
		if(question.getReceive_creation_date() != null) {
			job.put("receive_creation_date", question.getReceive_creation_date().toString().trim());
		}else {
			job.put("receive_creation_date", question.getReceive_creation_date());
		}
		

		return job.toJSONString();
	}
	
	//관리자 금지어리스트
	@RequestMapping(value="adminTaboo.do",method=RequestMethod.POST)
	public void adminTaboo(HttpServletResponse response) throws IOException {
		List<Taboo> tlist=adminService.selectTabooList();
		
		//전송용 최종 json 객체 생성
		JSONObject sendjson=new JSONObject();
		JSONArray jarr=new JSONArray();
		
		for(Taboo taboo : tlist) {
			JSONObject jtaboo=new JSONObject();
			jtaboo.put("content", URLEncoder.encode(taboo.getContent(),"utf-8"));
			
			jarr.add(jtaboo);
		}
		
		sendjson.put("tlist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendjson.toJSONString());
		out.flush();
		out.close();
		
	}
	
	//관리자 금지어 추가
	@RequestMapping("/adminTabooIn.do")
	public String insertTaboo(Taboo taboo) {
		adminService.insertTaboo(taboo);
		return "redirect:adminReport.do";
	}

	//관리자 신고글리스트
	@RequestMapping("adminReport.do")
	public String adminReport(Model model) {
		model.addAttribute("rlist",adminService.selectReportList());
		return "admin/adminReport";
	}
	
	//관리자 신고댓글 상세보기
	@ResponseBody
	@RequestMapping(value="adminReportDetail.do", method=RequestMethod.POST)
	public String adminReportDetail(HttpServletResponse response,
			@RequestParam(value = "reportid") int report_id) throws IOException {
		
		response.setContentType("application/json; charset=utf-8");
		AReport report=adminService.reportDetail(report_id);
		JSONObject job=new JSONObject();
		job.put("rnum", report.getRnum());
		job.put("report_id", report.getReport_id() );
		job.put("report_category_name", URLEncoder.encode(report.getReport_category_name(),"utf-8"));
		job.put("project_id", report.getProject_id() );
		job.put("project_reply_id", report.getProject_reply_id() );
		job.put("board_id", report.getBoard_id() );
		job.put("board_reply_id", report.getBoard_reply_id() );
		job.put("black_id", report.getBlack_id() );
		job.put("report_reason", URLEncoder.encode(report.getReport_reason(),"utf-8") );
		job.put("member_id", report.getMember_id() );
		job.put("report_date", report.getReport_date().toString().trim() );
		job.put("report_project_name", URLEncoder.encode(report.getReport_project_name(),"utf-8"));
		job.put("reply_content", URLEncoder.encode(report.getReply_content(),"utf-8") );
		job.put("report_count", report.getReport_count() );
		job.put("report_read_flag", report.getReport_read_flag() );
		
		return job.toJSONString();
	}

	//관리자 통계
	@RequestMapping("adminStat.do")
	public String adminStat() {
		return "admin/adminStat";
	}
	
	//관리자 결제 취소
	@RequestMapping("adminRefund.do")
	public String adminRefund() {
		return "admin/adminRefund";
	}

}
