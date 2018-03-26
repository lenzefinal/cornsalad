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
import com.devone.finalp.admin.model.vo.Astat;
import com.devone.finalp.common.model.vo.Notice;
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
	
	//관리자 신고글 확인 여부(신고글 수정)
	@Override
	public int reportAUpdate(int report_id) {
		return adminDao.reportAUpdate(report_id);
	}
	
	//관리자 게시글 신고카운트 올려주기
	@Override
	public int reportBUpdate(int board_id) {
		return adminDao.reportBUpdate(board_id);
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

	//관리자 프로젝트 수(페이징 처리용)
	@Override
	public int aproListCount() {
		return adminDao.aproListCount();
	}
	
	//관리자 프로젝트 리스트 조회
	@Override
	public List<AProject> selectProjectList(HashMap<String,Object> map) {
		return adminDao.selectProjectList(map);
	}

	//관리자 승인요청 프로젝트 리스트 조회
	@Override
	public List<AProject> selectOffProject() {
		return adminDao.selectOffProject();
	}
	
	//관리자 프로젝트 승인처리(프로젝트 활성화)
	@Override
	public int updateProjectOn(String project_id) {
		return adminDao.updateProjectOn(project_id);
	}
	
	//관리자 프로젝트 비활성화
	@Override
	public int updateProjectOff(String project_id) {
		return adminDao.updateProjectOff(project_id);
	}
	
	//관리가 프로젝트 승인거부
	@Override
	public int updateProjectWait(String project_id) {
		return adminDao.updateProjectWait(project_id);
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

	//관리자 신고 댓글 삭제
	@Override
	public int replyDelete(AReport report) {
		return adminDao.replyDelete(report);
	}
	
	//공지사항 개수(페이징 처리용)
	@Override
	public int noListCount() {
		return adminDao.noListCount();
	}
	
	//관리자 공지사항 리스트
	@Override
	public List<Notice> selectNoticeList(HashMap<String,Object> map) {
		return adminDao.selectNoticeList(map);
	}

	//관리자 공지사항 등록
	@Override
	public int noticeInsert(Notice notice) {
		return adminDao.noticeInsert(notice);
	}
	
	//관리자 공지사항 상세보기
	@Override
	public Notice noticeDetail(int notice_id) {
		return adminDao.noticeDetail(notice_id);
	}

	//관리자 공지사항 수정
	@Override
	public int noticeUpdate(Notice notice) {
		return adminDao.noticeUpdate(notice);
	}

	//관리자 공지사항삭제
	@Override
	public int noticeDelete(int notice_id) {
		return adminDao.noticeDelete(notice_id);
	}
	
	//관리자 통계(카테고리별 카운트)
	@Override
	public Astat categoryStat() {
		return adminDao.categoryStat();
	}

	//관리자 통계(매출 탑 10)
	@Override
	public List<Astat> moneyStat() {
		return adminDao.moneyStat();
	}

	//관리자 통계(후원자 탑 3)
	@Override
	public List<Astat> sponStat() {
		return adminDao.sponStat();
	}

	//관리자 ajax 검색용
	//문의글 답변 안된것만
	@Override
	public List<AQuestion> norequestion() {
		return adminDao.norequestion();
	}

	//문의글 답변 된것만
	@Override
	public List<AQuestion> okrequestion() {
		return adminDao.okrequestion();
	}

	//신고글 카테고리별 검색
	@Override
	public List<AReport> searchReport(String report_category_name) {
		return adminDao.searchReport(report_category_name);
	}

	//회원 검색(이름으로)
	@Override
	public List<AMember> searchMember(String searchM) {
		return adminDao.searchMember(searchM);
	}

	//공지사항 검색(제목+내용)
	@Override
	public List<Notice> searchNotice(String searchN) {
		return adminDao.searchNotice(searchN);
	}

	//프로젝트 카테고리별 검색
	@Override
	public List<AProject> searchCProejct(String cname) {
		return adminDao.searchCProject(cname);
	}

	//환불 프로젝트 검색
	@Override
	public List<AProject> searchRProejct() {
		return adminDao.serchRProejct();
	}
	
	//프로젝트 이름 검색
	@Override
	public List<AProject> searchTProejct(String title) {
		return adminDao.searchTProject(title);
	}
	
	
}
