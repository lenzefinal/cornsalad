package com.devone.finalp.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.devone.finalp.admin.model.vo.AMember;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
import com.devone.finalp.common.model.vo.Notice;
import com.devone.finalp.common.model.vo.Taboo;


@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//관리자 controller
	//관리자 인덱스
	@RequestMapping("adminMain.do")
	public String adminMain(Model model) {	
		model.addAttribute("aalarm",adminService.adminalarm());
		return "admin/adminIndex";
	}
	
	//관리자 알림용 ajax
	@ResponseBody
	@RequestMapping(value="adminAalarm.do", method=RequestMethod.POST)
	public String adminAalarm(HttpServletResponse response) throws IOException{
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job=new JSONObject();
		AAlarm alarm=adminService.adminalarm();
		job.put("reportcount", alarm.getReportcount());
		job.put("projectcount", alarm.getOffprojectcount());
		job.put("questioncount", alarm.getQuestioncount());
		
		return job.toJSONString();
	}

	//관리자 회원리스트
	@RequestMapping("adminMember.do")
	public String adminMember(Model model,HttpServletRequest request) {
		int currentPage=1;
		if(request.getParameter("currentPage")!=null) {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int limit = 10; //한 페이지에 출력할 목록 갯수
		int listCount = adminService.memListCount();
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		
		List<AMember> list=adminService.selectMemberList(map);
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		model.addAttribute("mlist",list);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "admin/adminMember";
	}
	
	//관리자 회원 상세보기
	@RequestMapping("adminMemberDetail.do")
	public String adminMemberDetail(@RequestParam(value = "member_name") String member_name,Model model) {
		model.addAttribute("mdetail",adminService.memberDetail(member_name));
		model.addAttribute("mplist",adminService.memberProject(member_name));
		return "admin/adminMemberDetail";
	}
	
	//관리자 회원 이미지 삭제
	@RequestMapping("adminImgDelete.do")
	public void memImgDelete(@RequestParam(value="member_name") String member_name,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		int result=adminService.memImgDelete(member_name);
		if(result > 0) {
			out.append("ok");
			out.flush();
		}else {
			out.append("fail");
			out.flush();
		}
		out.close();
	}
	
	//관리자 회원 정지(블랙리스트)
	@RequestMapping("adminMemberBlack.do")
	public String memberBlack(@RequestParam(value="member_name") String member_name, @RequestParam(value="num") int num) {
		
		int result=adminService.memberBlack(member_name);
		String viewname=null;
		if(num==0 && result > 0){
			System.out.println("리스트에서 회원블랙 오께이");
			viewname="redirect:adminMember.do";
		}else if(num==1 && result > 0) {
			System.out.println("상세보기에서 회원블랙 오께이");
			viewname="redirect:adminMemberDetail.do?member_name="+member_name;
		}else {
			System.out.println("회원블랙 실패");
			viewname="redirect:adminMember.do";
		}
		
		return viewname;
	}
	
	//관리자 회원 탈퇴(삭제)
	@RequestMapping("adminMemberDelete.do")
	public String memberDelete(@RequestParam(value="member_name") String member_name) {
		int result=adminService.memberDelete(member_name);
		if(result>0) {
			System.out.println("회원삭제 오께이");
		}else {
			System.out.println("회원삭제 실패");
		}
		return "redirect:adminMember.do";
	}

	//관리자 프로젝트리스트
	@RequestMapping("adminProject.do")
	public String adminProject(Model model) {
		model.addAttribute("oplist",adminService.selectOffProject());
		model.addAttribute("aplist",adminService.selectProjectList());
		return "admin/adminProject";
	}
	
	//관리자 프로젝트 승인처리(프로젝트 활성화)
	@RequestMapping("adminProjectOn.do")
	public String updateProjectOn(@RequestParam(value="project_id") String project_id) {
		int result=adminService.updateProjectOn(project_id);
		if(result>0)
			System.out.println("프로젝트 승인(활성화) 처리 완료");
		return "redirect:adminProject.do";
	}
	
	//관리자 프로젝트 비활성화
	@RequestMapping("adminProjectOff.do")
	public String updateProjectOff(@RequestParam(value="project_id") String project_id) {
		int result=adminService.updateProjectOff(project_id);
		if(result > 0)
			System.out.println("프로젝트 비활성화 처리 완료");
		return "redirect:adminProject.do";
	}

	//관리자 공지사항리스트
	@RequestMapping("adminNotice.do")
	public String adminNotice(Model model) {
		model.addAttribute("anlist",adminService.selectNoticeList());
		return "admin/adminNotice";
	}
	
	//관리자 공지사항 등록
	@RequestMapping("adminNoticeIn.do")
	public String noticeInsert(Notice notice) {
		int result=adminService.noticeInsert(notice);
		if(result > 0)
			System.out.println("등록 성공");
		return "redirect:adminNotice.do";
	}
	
	//관리자 공지사항 수정용 ajax
	@ResponseBody
	@RequestMapping(value="adminNoticeDet.do" , method=RequestMethod.POST)
	public String adminNoticeDetail(HttpServletResponse response,
			@RequestParam(value = "noticeid") int notice_id) throws IOException{
		response.setContentType("application/json; charset=utf-8");
		Notice notice=adminService.noticeDetail(notice_id);
		JSONObject job=new JSONObject();
		job.put("notice_id", notice.getNotice_id());
		job.put("title", URLEncoder.encode(notice.gettitle(),"utf-8"));
		job.put("creation_date", notice.getCreation_date().toString().trim());
		job.put("content", URLEncoder.encode(notice.getContent(),"utf-8"));
		
		return job.toJSONString();
	}
	
	
	//관리자 공지사항 수정
	@RequestMapping("adminNoticeUp.do")
	public String noticeUpdate(Notice notice) {
		int result=adminService.noticeUpdate(notice);
		if(result > 0)
			System.out.println("수정 성공");
		return "redirect:adminNotice.do";
	}
		
	//관리자 공지사항 삭제
	@RequestMapping("adminNoticeDe.do")
	public String noticeDelete(@RequestParam(value="notice_id") int notice_id ) {
		int result=adminService.noticeDelete(notice_id);
		if(result > 0)
			System.out.println("삭제 성공");
		return "redirect:adminNotice.do";
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
		job.put("receive_member_name", URLEncoder.encode(question.getReceive_member_name(),"utf-8"));
		job.put("send_member_name", URLEncoder.encode(question.getSend_member_name(),"utf-8"));
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
	
	//관리자 문의글 답변보내기(문의함 수정)
	@RequestMapping(value="adminQuUpdate.do", method=RequestMethod.POST)
	public String adminQuUpdate(AQuestion question) throws IOException{
		int result=adminService.updateQuestion(question);
		
		if(result>0) {
			System.out.println("수정 오께이");
		}else {
			System.out.println("수정 실패");
		}
		
		return "redirect:adminQuestion.do";
		
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
	@RequestMapping("adminTabooIn.do")
	public String insertTaboo(Taboo taboo) {
		adminService.insertTaboo(taboo);
		return "redirect:adminTaboo.do";
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
		job.put("black_name", URLEncoder.encode(report.getBlack_name(),"utf-8") );
		job.put("report_reason", URLEncoder.encode(report.getReport_reason(),"utf-8") );
		job.put("member_name", URLEncoder.encode(report.getMember_name(),"utf-8") );
		job.put("report_date", report.getReport_date().toString().trim() );
		job.put("report_project_name", URLEncoder.encode(report.getReport_project_name(),"utf-8"));
		if(report.getReply_content() != null) {
			job.put("reply_content", URLEncoder.encode(report.getReply_content(),"utf-8") );
		}else {
			job.put("reply_content",report.getReply_content());
		}
		job.put("report_count", report.getReport_count() );
		job.put("report_read_flag", report.getReport_read_flag() );
		
		return job.toJSONString();
	}
	
	//관리자 신고된 해당 댓글 삭제
	@RequestMapping("adminReplyDelete.do")
	public String replyDelete(@RequestParam(value="reply_id") int reply_id, 
			@RequestParam(value="report_category_name") String report_category_name) {
		AReport report = new AReport();
		if(report_category_name.equals("프로젝트 댓글 신고")) {
			report.setReport_category_name(report_category_name);
			report.setProject_reply_id(reply_id);
		}else {
			report.setReport_category_name(report_category_name);
			report.setBoard_reply_id(reply_id);
		}
		int result = adminService.replyDelete(report);
		if(result > 0)
			System.out.println("신고 댓글 삭제 성공");
		return "redirect:adminReport.do";
	}

	//관리자 통계
	@RequestMapping("adminStat.do")
	public String adminStat() {
		return "admin/adminStat";
	}
	
	//검색용 ajax 모아놓기
	//question검색(답변 미완료/완료)
	@RequestMapping(value="",method=RequestMethod.POST)
	public void searchQuestion(HttpServletResponse response,
			@RequestParam(value="option") String option) throws IOException {
		List<AQuestion> sqlist=null;
		
		if(option.equals("nore")) {
			sqlist=adminService.norequestion();
		}else if(option.equals("okre")) {
			sqlist=adminService.okrequestion();
		}else {
			sqlist=adminService.selectQuestionList();
		}
		
		JSONObject sendjson=new JSONObject();
		JSONArray jarr=new JSONArray();
		
		for(AQuestion aquestion : sqlist) {
			JSONObject jquestion=new JSONObject();
			jquestion.put("question_id", aquestion.getQuestion_id());
			jquestion.put("question_category_name", URLEncoder.encode(aquestion.getQuestion_category_name(),"utf-8"));
			jquestion.put("receive_member_name", URLEncoder.encode(aquestion.getReceive_member_name(),"utf-8"));
			jquestion.put("send_member_name", URLEncoder.encode(aquestion.getSend_member_name(),"utf-8"));
			jquestion.put("title", URLEncoder.encode(aquestion.getTitle(),"utf-8"));
			jquestion.put("content", URLEncoder.encode(aquestion.getContent(),"utf-8"));
			if(aquestion.getRe_content() != null) {
				jquestion.put("re_content", URLEncoder.encode(aquestion.getRe_content(),"utf-8"));
			}else {
				jquestion.put("re_content", aquestion.getRe_content());
			}
			jquestion.put("send_creation_date", aquestion.getSend_creation_date().toString().trim());
			if(aquestion.getReceive_creation_date() != null) {
				jquestion.put("receive_creation_date", aquestion.getReceive_creation_date().toString().trim());
			}else {
				jquestion.put("receive_creation_date", aquestion.getReceive_creation_date());
			}
			jarr.add(jquestion);
		}
		
		sendjson.put("sqlist", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendjson.toJSONString());
		out.flush();
		out.close();
	}
	

}
