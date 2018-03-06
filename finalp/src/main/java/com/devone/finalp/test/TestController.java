package com.devone.finalp.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	//ajax는 반환형이 void
	@RequestMapping(value="test1.do", method=RequestMethod.POST)
	public void test1Method(@RequestParam(value="name") String name,
			@RequestParam(value="age") int age,
			HttpServletResponse response/*ajax에 다시 넘겨줄 값을 남을 객체*/) throws IOException {
		
		System.out.println("name:"+name);
		System.out.println("age:"+age);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(name.equals("지으니")) {
			out.print("ok");
			out.flush();
		} else {
			out.append("fail");
			out.flush();
		}
		
		out.close();
	}
	
	//스트림에 연결해서 내보내는 작업을 자동으로 해 주는 어노테이션
	@ResponseBody //결과를 response에 담아서 보내는 어노테이션
	@RequestMapping(value="test2.do", method=RequestMethod.POST)
	public String test2Method(HttpServletResponse response) throws IOException{
		
		response.setContentType("application/json; charset=UTF-8");
		
		//org.json.simple.JSONObject
		JSONObject job = new JSONObject();
		job.put("no", 53);
		job.put("title", "title!!!!!!!!!");
		job.put("writer", URLEncoder.encode("지으니", "UTF-8"));
		job.put("content", URLEncoder.encode("내용이다 암거나 쓰자 이거 두 줄로 됐으면 좋겠다 그럴려면 내용을 많이 써야하는데", "UTF-8"));
		
		
		//return으로 보낸 값은 response에 저장됨
		return job.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="test3.do", method=RequestMethod.POST)
	public String test3Method(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		//list를 json 배열로 만들어서 뷰로 리턴 
		ArrayList<User> list = new ArrayList<User>();
		list.add(new User("user1", "user11", "김이사", 45, "gheg@naer.com", "01076434837"));
		list.add(new User("user2", "user22", "박차랑", 45, "hcvq@naer.com", "0106731365"));
		list.add(new User("user3", "user33", "가대리", 45, "rbhbr3334@naer.com", "01022348579"));
		list.add(new User("user4", "user44", "무과장", 45, "gajytt1@naer.com", "010123834352"));
		list.add(new User("user5", "user55", "우사원", 45, "bxwtr@naer.com", "0102136535"));
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(User user : list) {
			JSONObject juser = new JSONObject();
			juser.put("userId", user.getUserId());
			juser.put("userPwd", user.getUserPwd());
			juser.put("userName", URLEncoder.encode(user.getUserName(), "UTF-8"));
			juser.put("age", user.getAge());
			juser.put("email", user.getEmail());
			juser.put("phone", user.getPhone());
			
			jarr.add(juser);
		}
		
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
		
		/*
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();*/
	}
	
	@RequestMapping(value="/projectlist.do")
	public String selectProjectList() {
		System.out.println("아아");
		return "project/projectListView";
	}
}
