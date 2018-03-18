package com.devone.finalp.admin.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.admin.model.dao.AdminDao;
import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AMember;
import com.devone.finalp.admin.model.vo.AProject;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
import com.devone.finalp.common.model.vo.Taboo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	//관리자 알람 및 인덱스
	@Override
	public AAlarm adminalarm() {
		return adminDao.adminalarm();
	}

	//관리자 금지어 리스트 조회
	@Override
	public List<Taboo> selectTabooList() {
		return adminDao.selectTabooList();
	}

	//관리자 금지어 추가
	@Override
	public int insertTaboo(Taboo taboo) {
		return adminDao.insertTaboo(taboo);
	}

	//관리자 신고글 리스트 조회
	@Override
	public List<AReport> selectReportList() {
		return adminDao.selectReportList();
	}

	//관리자 신고글 상세보기
	@Override
	public AReport reportDetail(int report_id) {
		return adminDao.reportDetail(report_id);
	}

	//관리자 문의글 리스트
	@Override
	public List<AQuestion> selectQuestionList() {
		return adminDao.selectQuestionList();
	}

	//관리자 문의글 상세보기
	@Override
	public AQuestion aquestionDetail(int question_id) {
		return adminDao.aquestionDetail(question_id);
	}

	//관리자 문의 답변하기(문의함 수정)
	@Override
	public int updateQuestion(AQuestion question) {
		return adminDao.updateQuestion(question);
	}

	//관리자 프로젝트 리스트 조회
	@Override
	public List<AProject> selectProjectList() {
		return adminDao.selectProjectList();
	}

	//관리자 승인요청 프로젝트 리스트 조회
	@Override
	public List<AProject> selectOffProject() {
		return adminDao.selectOffProject();
	}
	
	//관리자 회원 수(페이징 처리용)
	@Override
	public int memListCount() {
		return adminDao.memListCount();
	}

	//관리자 회원리스트 조회
	@Override
	public List<AMember> selectMemberList(HashMap<String, Object> map) {
		return adminDao.selectMemberList(map);
	}

	//관리자 회원 상세보기
	@Override
	public AMember memberDetail(String member_name) {
		return adminDao.memberDetail(member_name);
	}

	//관리자 회원이 올린 프로젝트 조회
	@Override
	public List<AProject> memberProject(String member_name) {
		return adminDao.memberProject(member_name);
	}

	//관리자 회원 이미지 삭제
	@Override
	public int memImgDelete(String member_name) {
		return adminDao.memImgDelete(member_name);
	}

	//관리자 회원 블랙리스트 처리
	@Override
	public int memberBlack(String member_name) {
		return adminDao.memberBlack(member_name);
	}

	//관리자 회원 탈퇴처리(삭제)
	@Override
	public int memberDelete(String member_name) {
		return adminDao.memberDelete(member_name);
	}
	
	
}
