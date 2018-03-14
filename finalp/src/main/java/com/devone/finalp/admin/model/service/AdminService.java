package com.devone.finalp.admin.model.service;

import java.util.List;

import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
import com.devone.finalp.common.model.vo.Taboo;

public interface AdminService {

	AAlarm adminalarm();
	List<Taboo> selectTabooList();
	int insertTaboo(Taboo taboo);
	List<AReport> selectReportList();
	AReport reportDetail(int report_id);
	List<AQuestion> selectQuestionList();
	AQuestion aquestionDetail(int question_id);
}
