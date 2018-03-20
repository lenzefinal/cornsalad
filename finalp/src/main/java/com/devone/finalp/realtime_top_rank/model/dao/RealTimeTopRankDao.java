package com.devone.finalp.realtime_top_rank.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.realtime_top_rank.model.vo.RealTimeRankTopView;

@Repository("realTimeTopRankDao")
public class RealTimeTopRankDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<RealTimeRankTopView> selectListAmoutTop5() {
		return mybatis.selectList("realtimeTopRankMapper.selectListAmoutTop5");
	}

	public List<RealTimeRankTopView> selectListCountTop5() {
		return mybatis.selectList("realtimeTopRankMapper.selectListCountTop5");
	}

	public List<RealTimeRankTopView> selectListExpectationTop5() {
		return mybatis.selectList("realtimeTopRankMapper.selectListExpectationTop5");
	}
	
	
}
