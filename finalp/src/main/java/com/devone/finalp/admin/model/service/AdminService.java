package com.devone.finalp.admin.model.service;

import java.util.HashMap;
import java.util.List;

import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AMember;
import com.devone.finalp.admin.model.vo.AProject;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
import com.devone.finalp.admin.model.vo.Astat;
import com.devone.finalp.common.model.vo.Notice;
import com.devone.finalp.common.model.vo.Taboo;

public interface AdminService {

	AAlarm adminalarm();
	List<Taboo> selectTabooList();
	int insertTaboo(Taboo taboo);
	List<AReport> selectReportList();
	AReport reportDetail(int report_id);
	int reportAUpdate(int report_id);
	List<AQuestion> selectQuestionList();
	AQuestion aquestionDetail(int question_id);
	int updateQuestion(AQuestion question);
	int aproListCount();
	List<AProject> selectProjectList(HashMap<String,Object> map);
	List<AProject> selectOffProject();
	int updateProjectOn(String project_id);
	int updateProjectOff(String project_id);
	int memListCount();
	List<AMember> selectMemberList(HashMap<String,Object> map);
	AMember memberDetail(String member_name);
	List<AProject> memberProject(String member_name);
	int memImgDelete(String member_name);
	int memberBlack(String member_name);
	int memberDelete(String member_name);
	int replyDelete(AReport report);
	int noListCount();
	List<Notice> selectNoticeList(HashMap<String,Object> map);
	int noticeInsert(Notice notice);
	Notice noticeDetail(int notice_id);
	int noticeUpdate(Notice notice);
	int noticeDelete(int notice_id);
	Astat categoryStat();
	List<Astat> moneyStat();
	List<Astat> sponStat();
	
	List<AQuestion> norequestion();
	List<AQuestion> okrequestion();
	List<AReport> searchReport(String report_category_name);
	List<AMember> searchMember(String searchM);
	List<Notice> searchNotice(String searchN);
	List<AProject> searchCProejct(String cname);
	List<AProject> searchRProejct();
	List<AProject> searchTProejct(String title);
	
}
