package com.devone.finalp.project_list.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devone.finalp.project_list.model.service.ProjectListService;
import com.devone.finalp.project_list.model.vo.ProjectListView;

@Controller
public class ProjectListController {
	
	@Autowired
	private ProjectListService projectListService;
	
	@RequestMapping(value="projectlist.do")
	public String selectProjectList(Model model){
		model.addAttribute("list", projectListService.selectProjectList());
		
		return "project/projectListView";
	}
	
	@RequestMapping(value="keywordAndCategory.do", method=RequestMethod.POST)
	public void selectKeywordCategory(@RequestParam(value="category_sub_id") String[] category,
									  @RequestParam(value="project_name") String project_name,
									  HttpServletResponse response) throws IOException {
		ArrayList<ProjectListView> list = new ArrayList<ProjectListView>();

		List<String> categoryList = new ArrayList<String>();
		
		if(category[0].equals("") && project_name.equals(" ")) {
			
			list.addAll(projectListService.selectProjectList());
			
		}else if(!category[0].equals("") && !project_name.equals(" ")) {
			
			for(int i=0; i<category.length; i++) {
				categoryList.add(category[i]);
			}
			
			list.addAll(projectListService.selectKeywordCategory(categoryList, project_name));
			
		}else if(category[0].equals("") && !project_name.equals(" ")) {
			
			list.addAll(projectListService.selectProjectListKeyword(project_name));
			
		}else {
			for(int i=0; i<category.length; i++) {
				categoryList.add(category[i]);
			}
			
			list.addAll(projectListService.selectProjectListCategory(categoryList));
		}
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(ProjectListView project : list) {
			JSONObject job = new JSONObject();
			job.put("project_id", project.getProject_id());
			job.put("image_rename", URLEncoder.encode(project.getImage_rename(),"utf-8"));
			job.put("project_name", URLEncoder.encode(project.getProject_name(),"utf-8"));
			job.put("project_category_id", project.getCategory_id());
			job.put("project_category_name", project.getCategory_name());
			job.put("category_sub_id", project.getCategory_sub_id());
			job.put("category_sub_name", project.getCategory_sub_name());
			job.put("category_id", project.getCategory_id());
			job.put("category_name", project.getCategory_name());
			job.put("start_date", project.getStart_date().toString());
			job.put("end_date", project.getEnd_date().toString());
			job.put("member_id", project.getMember_id());
			job.put("member_name", URLEncoder.encode(project.getMember_name(),"utf-8"));
			job.put("target_amount", project.getTarget_amount());
			job.put("dday", Integer.valueOf(project.getDday()).toString());
			job.put("total_amount", project.getTotal_amount());
			job.put("percent", project.getPercent());
			
			jarr.add(job);
		}
		sendJson.put("list", jarr); // returnJarr 메소드 아래에 있음 
		
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
}
