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
		wService.insertWC(wc);
		model.addAttribute("webchat",wc);
		model.addAttribute("wcList",wService.selectWCList());
		return "webchat/webchat";
	}
	
	@RequestMapping(value="wcList.do")
	public String wcList(Model model) {
		model.addAttribute("wcList",wService.selectWCList());
		return "webchat/chatList";
	}
	
	@RequestMapping(value="inchat.do")
	public String inchat(Webchat wc, Model model,Random ran) {
		if(wService.searchWC(wc.getRoom_reply_id())==null) {
			return "webchat/errorChat";
		}else{
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
		String room_id = simDf.format(new Date(currentTime))+ran.nextInt(50);
		wc.setRoom_id(room_id);
		wService.insertWC(wc);
		model.addAttribute("webchat", wc);
		model.addAttribute("wcList",wService.selectWCList());
		return "webchat/webchat";
		}
	}
	
	@RequestMapping(value="wcdelete.do")
	public void deleteroom(Webchat wc) {
		wService.deleteWC(wc.getRoom_id());
	}
}
