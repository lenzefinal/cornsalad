package com.devone.finalp.realtime_top_rank.model.service;

import java.util.List;

import com.devone.finalp.realtime_top_rank.model.vo.RealTimeRankTopView;

public interface RealTimeTopRankService {

	List<RealTimeRankTopView> selectListAmoutTop5();
	List<RealTimeRankTopView> selectListCountTop5();
	List<RealTimeRankTopView> selectListExpectationTop5();
}
