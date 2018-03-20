package com.devone.finalp.realtime_top_rank.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.realtime_top_rank.model.dao.RealTimeTopRankDao;
import com.devone.finalp.realtime_top_rank.model.vo.RealTimeRankTopView;

@Service("realTimeTopRankService")
public class RealTimeTopRankServiceImpl implements RealTimeTopRankService{

	@Autowired
	private RealTimeTopRankDao realTimeTopRankDao;
	
	@Override
	public List<RealTimeRankTopView> selectListAmoutTop5() {
		return realTimeTopRankDao.selectListAmoutTop5();
	}

	@Override
	public List<RealTimeRankTopView> selectListCountTop5() {
		return realTimeTopRankDao.selectListCountTop5();
	}

	@Override
	public List<RealTimeRankTopView> selectListExpectationTop5() {
		return realTimeTopRankDao.selectListExpectationTop5();
	}

}
