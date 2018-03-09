package com.devone.finalp.project_status.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProjectStatusController {

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
}
