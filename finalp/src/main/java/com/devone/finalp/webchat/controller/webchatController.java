package com.devone.finalp.webchat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.common.model.vo.Webchat;
import com.devone.finalp.webchat.model.service.webchatService;

@Controller
public class webchatController {
	@Autowired
	private webchatService wService;
	 
	
	@RequestMapping(value="chat.do")
	public String chat(Webchat wc, Model model, Random ran) {
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String room_id = simDf.format(new Date(currentTime))+ran.nextInt(50);
		wc.setRoom_id(room_id);
		wc.setRoom_reply_id(room_id);
		System.out.println(wc);
		wService.insertWC(wc);
		model.addAttribute("webchat",wc);
		
		return "webchat/webchat";
	}
	
	@RequestMapping(value="wcList.do")
	public String wcList(Model model, int page, String c_id) {
		int limit=10;
		int listcount = wService.getlistCount(c_id);
		int startnum = (page-1) * limit +1;
		int endnum = startnum + limit -1;
		int maxpage = (int)((double)listcount/limit + 0.9);
		int startpage = (((int)((double)page/limit + 0.9))-1) * limit + 1;
		int endpage = startpage + limit -1;
		if(maxpage < endpage) {
			endpage = maxpage;
		}
		Board_Pagectr bp = new Board_Pagectr(startnum, endnum,startpage,endpage,maxpage,page,c_id);
		model.addAttribute("pagectr", bp);
		model.addAttribute("wcList",wService.selectWCList(bp));
		return "webchat/chatList";
	}
	
	@RequestMapping(value="inchat.do")
	public String inchat(Webchat wc, Model model,Random ran, HttpServletResponse rs) throws IOException {
		rs.setCharacterEncoding("utf-8");
		rs.setContentType("text/html; charset=UTF-8");
		if(wc.getMember_id().equals("") ){
			PrintWriter output = rs.getWriter();
			output.println("<script language='javascript'>");
			output.println("alert('로그인 후 이용해 주세요')");
			output.println("window.close();");
			output.println("</script>");
			output.close();
			return null;
		}
		else if(wService.searchWC(wc.getRoom_reply_id())==null) {
			return "webchat/errorChat";
		}else{
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String room_id = simDf.format(new Date(currentTime))+ran.nextInt(50);
		wc.setRoom_id(room_id);
		wService.insertWC(wc);
		model.addAttribute("webchat", wc);
		return "webchat/webchat";
		}
	}
	
	@RequestMapping(value="wcdelete.do")
	public void deleteroom(Webchat wc) {
		wService.deleteWC(wc.getRoom_id());
	}
}
