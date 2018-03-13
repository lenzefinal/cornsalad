package com.devone.finalp.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.admin.model.dao.AdminDao;
import com.devone.finalp.admin.model.vo.AAlarm;
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
	public AReport reportDetail(int rid) {
		return adminDao.reportDetail(rid);
	}
	
	
	
}
