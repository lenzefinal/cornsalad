package com.devone.finalp.project_status.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.SubCategory;
import com.devone.finalp.project_status.model.service.ProjectStatusService;

@Controller
public class ProjectStatusController {
	
	@Autowired
	private ProjectStatusService projectStatusService;

	@RequestMapping("fundingInsertView.do")
	public String fundingInsertViewMethod() {
		return "projectStatus/fundingInsertView";
	}
	
	@RequestMapping("contentImgUpload.do")
	public void contentImgUploadMethod(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		System.out.println("서블릿들어왔다");
		
		//파일 업로드
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile uploadFile = multipartRequest.getFile("file");
		
		//웹 서버 컨테이너 경로 추출
		String root = request.getSession().getServletContext().getRealPath("resources/");
		
		System.out.println(root);
		
		//파일 저장 경로
		//스프링에서는 프로젝트\target\m2e-wtp\web-resources\ 아래에 폴더를 만들어야 함
		//임의의 폴더를 정해서 지정해도 됨 
		String savePath = root + "uploadImages/";
		
		//업로드한 파일이 있으면
		if(!uploadFile.isEmpty()) {
			//파일의 원래 이름
			String ofileName = uploadFile.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			//바꿀 이름 = 날짜 + 원래 이름에서 확장명 뺀 나머지
			String rfileName = sdf.format(new Date(System.currentTimeMillis()))+"."
							+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			
			//이름 변경
			uploadFile.transferTo(new File(savePath + rfileName));
			
			
			String totalFileName = "/finalp/resources/uploadImages/" + rfileName;
			
			System.out.println("uploadFiles:"+totalFileName);
			response.getWriter().print(totalFileName);
		/*	board.setBoard_original_filename(ofileName);
			board.setBoard_rename_filename(rfileName);*/
		}
		
		/*request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String savePath = request.getSession().getServletContext().getRealPath("/upload");
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			System.out.println("form의 enctype='multipart/form-date' 설정 안 함");
		}
		
		int maxSize = 1024 * 1024 * 10;
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String filename = mrequest.getFilesystemName("file");
		//System.out.println("서블릿 filename:"+filename);
		
		String totalFileName = "/final/upload" + File.separator + filename;
		//System.out.println("서블릿 totalFileName:"+totalFileName);
		
		response.getWriter().print(totalFileName);*/
	}
	
	@ResponseBody
	@RequestMapping(value="proStscategoryList.do", method=RequestMethod.POST)
	public String proStscategoryListMethod(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		List<Category> list = projectStatusService.selectAllCategory();
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(Category category : list) {
			JSONObject juser = new JSONObject();
			juser.put("categoryId", category.getCategory_id());
			juser.put("categoryName", URLEncoder.encode(category.getCategory_name(), "UTF-8"));
			
			jarr.add(juser);
		}

		sendJson.put("list", jarr);
		
		
		return sendJson.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="proStsSubcategoryListByCaId.do", method=RequestMethod.POST)
	public String proStsSubcategoryListByCaIdMethod(
			@RequestParam(value="categoryId") String categoryId,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		List<SubCategory> list = projectStatusService.selectListSubCategoryByCaId(categoryId);
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(SubCategory subcategory : list) {
			JSONObject juser = new JSONObject();
			juser.put("subCategoryId", subcategory.getCategory_sub_id());
			juser.put("subCategoryName", URLEncoder.encode(subcategory.getCategory_sub_name(), "UTF-8"));
			juser.put("categoryId", subcategory.getCategory_id());
			
			jarr.add(juser);
		}

		sendJson.put("list", jarr);
		
		
		return sendJson.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="proStsBankList.do", method=RequestMethod.POST)
	public String proStsBankListMethod(HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		List<Bank> list = projectStatusService.selectAllBank();
		
		//전송용 최종 json 객체 생성
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		//list를 jsonArray로 복사
		for(Bank bank : list) {
			JSONObject juser = new JSONObject();
			juser.put("bankId", bank.getBank_id());
			juser.put("bankName", URLEncoder.encode(bank.getBank_name(), "UTF-8"));
			
			jarr.add(juser);
		}

		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="insertProject.do", method=RequestMethod.POST)
	public String insertProjectMethod(
			Project project, 
			@RequestParam(value="projectCategoryId") String proCateId,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		System.out.println("[insertProject.do]");

		response.setContentType("application/json; charset=UTF-8");
		
		project.setProject_category_id(proCateId);
		
		//sqe
		int sqeNextval = projectStatusService.selectProjectIdSeqNextval();
		
		String proId = "" + System.currentTimeMillis() + sqeNextval;
		project.setProject_id(proId);
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		project.setMember_id(loginUser.getMember_id());
		
		System.out.println("servlet-memid]"+loginUser.getMember_id());
		
		//DB에 insert
		int result = projectStatusService.insertProject(project);

		
		System.out.println("insert에서 아이디]"+proId);
		
		
		//return으로 보낸 값은 response에 저장됨
		return proId;
		
	}
	
	@ResponseBody
	@RequestMapping(value="projectRepImageUpload.do", method=RequestMethod.POST)
	public void projectRepImageUploadMethod(
			Project project,
			HttpServletRequest request) throws IOException {
		
		System.out.println("[projectRepImageUpload.do]");
		
		//파일 업로드
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile uploadFile = multipartRequest.getFile("fileObj");
		
		//웹 서버 컨테이너 경로 추출
		String root = request.getSession().getServletContext().getRealPath("resources/");
		
		//파일 저장 경로
		//스프링에서는 프로젝트\target\m2e-wtp\web-resources\ 아래에 폴더를 만들어야 함
		//임의의 폴더를 정해서 지정해도 됨 
		String savePath = root + "uploadProPreImages/";
		
		//업로드한 파일이 있으면
		if(!uploadFile.isEmpty()) {
			//원래 파일이 있나 확인
			System.out.println("update에서 아이디]"+project.getProject_id());
			Project preProject = projectStatusService.selectOneProjectByProId(project.getProject_id());
			
			System.out.println(preProject);
			
			if(preProject.getImage_rename() != null) {
				//전송된 파일이 있는 경우 원래 파일 지우고
				File deleteFile = new File(savePath + preProject.getImage_rename());
				deleteFile.delete();
			}
			
			//파일의 원래 이름
			String ofileName = uploadFile.getOriginalFilename();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			//바꿀 이름 = 날짜 + 원래 이름에서 확장명 뺀 나머지
			String rfileName = sdf.format(new Date(System.currentTimeMillis()))+"."
							+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			
			//이름 변경
			uploadFile.transferTo(new File(savePath + rfileName));
			
			project.setImage_oriname(ofileName);
			project.setImage_rename(rfileName);
		}

		//DB에 update
		projectStatusService.updateProjectToUploadImg(project);
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="updateProject.do", method=RequestMethod.POST)
	public ResponseEntity<String> updateProjectMethod(
			Project project,
			@RequestBody String param) throws Exception {
		
		System.out.println("[updateProject.do]");
		
		//web.xml에서 한글 인코딩 처리가 없으면
		//request.setCharacterEncoding("UTF-8");
		
		
		
		//전송 온 문자열을 json 객체로 변환 처리
		JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject)parser.parse(param);
		
		System.out.println(job.get("project_id"));
		System.out.println(job.get("category_sub_id"));
		System.out.println(job.get("project_name"));
		System.out.println(job.get("rep_content"));
		System.out.println(job.get("target_amount"));
		System.out.println(job.get("end_date"));
		System.out.println(job.get("refund_role"));
		System.out.println(job.get("certif_flag"));
		
		project.setProject_id((String)job.get("project_id"));
		project.setCategory_sub_id((String)job.get("category_sub_id"));
		project.setProject_name((String)job.get("project_name"));
		project.setRep_content((String)job.get("rep_content"));
		project.setRefund_role((String)job.get("refund_role"));
		project.setCertif_flag((String)job.get("certif_flag"));
		
		//목표 금액
		int targetAmount = 0;
		String targetAmountStr = (String)job.get("target_amount");
		
		try {
			targetAmount = Integer.parseInt(targetAmountStr);
		} catch(NumberFormatException e) {
			targetAmount = 0;
		}
		
		project.setTarget_amount(targetAmount);
		
		
		//마감일
		String endDateStr = (String)job.get("end_date");
		GregorianCalendar gcal = new GregorianCalendar();
		
		SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyyy");
		gcal.setTime(sdf.parse(endDateStr));
		
		Date date = new Date(gcal.getTimeInMillis());
		
		System.out.println(endDateStr);
		System.out.println(date);
		
		project.setEnd_date(date);
	
		//DB에 update
		projectStatusService.updateProject(project);
		
		
		//정상 완료됨을 클라이언트로 성공값을 보냄
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
