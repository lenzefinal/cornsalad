package com.devone.finalp.realtime_top_rank.controller;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devone.finalp.realtime_top_rank.model.service.RealTimeTopRankService;
import com.devone.finalp.realtime_top_rank.model.vo.RealTimeRankTopView;

@Controller
public class RealTimeTopRankController {

	@Autowired
	private RealTimeTopRankService realTimeTopRankService;
	
	@ResponseBody
	@RequestMapping(value="realTimePaymentAmountTopRank.do", method=RequestMethod.POST)
	public String realTimePaymentAmountTopRankMethod(
			HttpServletResponse response) throws Exception{

		response.setContentType("application/json; charset=UTF-8");
		
		List<RealTimeRankTopView> list = realTimeTopRankService.selectListAmoutTop5();
		
		//System.out.println("AmountTopRank]"+list);
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(RealTimeRankTopView topRank : list) {
			JSONObject juser = new JSONObject();
			juser.put("rankNum", topRank.getRank_num());
			juser.put("projectId", topRank.getProject_id());
			juser.put("projectName", URLEncoder.encode(topRank.getProject_name(), "UTF-8"));
			juser.put("projectCategoryId", topRank.getProject_category_id());
			juser.put("imageRename", topRank.getImage_rename());
			
			jarr.add(juser);
		}
		
		sendJson.put("list", jarr);	
		
		return sendJson.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="realTimePaymentCountTopRank.do", method=RequestMethod.POST)
	public String realTimePaymentCountTopRankMethod(
			HttpServletResponse response) throws Exception{

		response.setContentType("application/json; charset=UTF-8");
		
		List<RealTimeRankTopView> list = realTimeTopRankService.selectListCountTop5();
		
		//System.out.println("CountTopRank]"+list);
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(RealTimeRankTopView topRank : list) {
			JSONObject juser = new JSONObject();
			juser.put("rankNum", topRank.getRank_num());
			juser.put("projectId", topRank.getProject_id());
			juser.put("projectName", URLEncoder.encode(topRank.getProject_name(), "UTF-8"));
			juser.put("projectCategoryId", topRank.getProject_category_id());
			juser.put("imageRename", topRank.getImage_rename());
			
			jarr.add(juser);
		}
		
		sendJson.put("list", jarr);	
		
		return sendJson.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="realTimeExpectationTopRank.do", method=RequestMethod.POST)
	public String realTimeExpectationTopRankMethod(
			HttpServletResponse response) throws Exception{

		response.setContentType("application/json; charset=UTF-8");
		
		List<RealTimeRankTopView> list = realTimeTopRankService.selectListExpectationTop5();
		
		//System.out.println("CountTopRank]"+list);
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(RealTimeRankTopView topRank : list) {
			JSONObject juser = new JSONObject();
			juser.put("rankNum", topRank.getRank_num());
			juser.put("projectId", topRank.getProject_id());
			juser.put("projectName", URLEncoder.encode(topRank.getProject_name(), "UTF-8"));
			juser.put("projectCategoryId", topRank.getProject_category_id());
			juser.put("imageRename", topRank.getImage_rename());
			
			jarr.add(juser);
		}
		
		sendJson.put("list", jarr);	
		
		return sendJson.toJSONString();
	}
}
