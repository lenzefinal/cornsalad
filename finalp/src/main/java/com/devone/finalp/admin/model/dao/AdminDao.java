package com.devone.finalp.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AMember;
import com.devone.finalp.admin.model.vo.AProject;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
import com.devone.finalp.common.model.vo.Notice;
import com.devone.finalp.common.model.vo.Taboo;

@Repository("adminDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public AAlarm adminalarm() {
		return mybatis.selectOne("adminmapper.adminalarm");
	}

	public List<Taboo> selectTabooList() {
		return mybatis.selectList("adminmapper.taboolist");
	}

	public int insertTaboo(Taboo taboo) {
		return mybatis.insert("adminmapper.inserttaboo", taboo);
	}

	public List<AReport> selectReportList() {
		return mybatis.selectList("adminmapper.reportlist");
	}

	public AReport reportDetail(int report_id) {
		return mybatis.selectOne("adminmapper.reportdetail", report_id);
	}
	
	public int reportAUpdate(int report_id) {
		return mybatis.update("adminmapper.reportUpdate", report_id);
	}

	public List<AQuestion> selectQuestionList() {
		return mybatis.selectList("adminmapper.questionlist");
	}

	public AQuestion aquestionDetail(int question_id) {
		return mybatis.selectOne("adminmapper.questiondetail", question_id);
	}

	public int updateQuestion(AQuestion question) {
		return mybatis.update("adminmapper.updatequestion", question);
	}

	public List<AProject> selectProjectList() {
		return mybatis.selectList("adminmapper.selectprojectlist");
	}

	public List<AProject> selectOffProject() {
		return mybatis.selectList("adminmapper.selectoffproject");
	}
	
	public int updateProjectOn(String project_id) {
		return mybatis.update("adminmapper.ponupdate", project_id);
	}

	public int memListCount() {
		return mybatis.selectOne("adminmapper.memlistCount");
	}

	public List<AMember> selectMemberList(HashMap<String, Object> map) {
		return mybatis.selectList("adminmapper.selectmemberlist", map);
	}

	public AMember memberDetail(String member_name) {
		return mybatis.selectOne("adminmapper.memberDetail",member_name);
	}

	public List<AProject> memberProject(String member_name) {
		return mybatis.selectList("adminmapper.memberProject", member_name);
	}

	public int memImgDelete(String member_name) {
		return mybatis.update("adminmapper.memImgDelete", member_name);
	}

	public int memberBlack(String member_name) {
		return mybatis.update("adminmapper.memberBlack", member_name);
	}

	public int memberDelete(String member_name) {
		return mybatis.delete("adminmapper.memberDelete", member_name);
	}

	public int replyDelete(AReport report) {
		return mybatis.delete("adminmapper.replyDelete", report);
	}

	public List<Notice> selectNoticeList() {
		return mybatis.selectList("adminmapper.noticeList");
	}

	public int noticeInsert(Notice notice) {
		return mybatis.insert("adminmapper.noticeInsert", notice);
	}
	
	public Notice noticeDetail(int notice_id) {
		return mybatis.selectOne("adminmapper.noticeDetail", notice_id);
	}

	public int noticeUpdate(Notice notice) {
		return mybatis.update("adminmapper.noticeUpdate", notice);
	}

	public int noticeDelete(int notice_id) {
		return mybatis.delete("adminmapper.noticeDelete",notice_id);
	}

	

}
