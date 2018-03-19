package com.devone.finalp.admin.model.service;

import java.util.HashMap;
import java.util.List;

import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AMember;
import com.devone.finalp.admin.model.vo.AProject;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
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
	List<AProject> selectProjectList();
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
	List<Notice> selectNoticeList();
	int noticeInsert(Notice notice);
	Notice noticeDetail(int notice_id);
	int noticeUpdate(Notice notice);
	int noticeDelete(int notice_id);
	
}
