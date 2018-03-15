package com.devone.finalp.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.admin.model.vo.AAlarm;
import com.devone.finalp.admin.model.vo.AQuestion;
import com.devone.finalp.admin.model.vo.AReport;
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

	public List<AQuestion> selectQuestionList() {
		return mybatis.selectList("adminmapper.questionlist");
	}

	public AQuestion aquestionDetail(int question_id) {
		return mybatis.selectOne("adminmapper.questiondetail", question_id);
	}

}
