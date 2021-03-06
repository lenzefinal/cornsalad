package com.devone.finalp.project_status.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Category;
import com.devone.finalp.common.model.vo.Gift;
import com.devone.finalp.common.model.vo.GiftInItems;
import com.devone.finalp.common.model.vo.Item;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Product;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.ProjectAccount;
import com.devone.finalp.common.model.vo.ProjectContent;
import com.devone.finalp.common.model.vo.SubCategory;
import com.devone.finalp.member_status.controller.SMTPAuthenticator;
import com.devone.finalp.project_status.model.service.ProjectStatusService;
import com.devone.finalp.project_status.model.vo.GiftInItemsUpdate;
import com.devone.finalp.project_status.model.vo.ProjectStatusUpdate;

@Controller
public class ProjectStatusController {
	
	@Autowired
	private ProjectStatusService projectStatusService;
	
	@RequestMapping("projectInsertGuideView.do")
	public String projectInsertGuideMethod() {
		return "projectStatus/projectInsertGuideView";
	}
	
	@RequestMapping("certifPage.do")
	public String certifPageMethod() {
		return "projectStatus/certifPage";
	}

	@RequestMapping("fundingInsertView.do")
	public String fundingInsertViewMethod() {
		return "projectStatus/fundingInsertView";
	}
	
	@RequestMapping("grouppurInsertView.do")
	public String grouppurInsertViewMethod() {
		return "projectStatus/grouppurInsertView";
	}
	
	
	@RequestMapping("projectSendRequestView.do")
	public String projectSendRequestViewMethod(
			@RequestParam(value="projectName") String projectName,
			Model model) {
		
		model.addAttribute("projectName", projectName);
		
		return "projectStatus/projectSendRequestView";
	}
	
	@RequestMapping("fundingUpdateView.do")
	public String fundingUpdateViewMethod(@RequestParam(value="project_id") String projectId,
			Model model) {
		
		ProjectStatusUpdate project = projectStatusService.selectOneProjectStatusUpdateByProId(projectId);
		ProjectContent projectCon = projectStatusService.selectOneProjectContentByProId(projectId);
		ProjectAccount projectAcc = projectStatusService.selectOneProjectAccountByProId(projectId);
		List<Item> itemList = projectStatusService.selectListItem(projectId);
		List<Gift> giftList = projectStatusService.selectListGift(projectId);
		List<GiftInItemsUpdate> giftinitemList = projectStatusService.selectListGiftInItemsUpdate(projectId);
		
		System.out.println(project.getProject_name());
		
		model.addAttribute("project", project);
		model.addAttribute("projectCon", projectCon);
		model.addAttribute("projectAcc", projectAcc);
		model.addAttribute("itemList", itemList);
		model.addAttribute("giftList", giftList);
		model.addAttribute("giftinitemList", giftinitemList);
		
		return "projectStatus/fundingUpdateView";
	}
	
	@RequestMapping("grouppurUpdateView.do")
	public String grouppurUpdateViewMethod(@RequestParam(value="projectId") String projectId,
			Model model) {
		
		ProjectStatusUpdate project = projectStatusService.selectOneProjectStatusUpdateByProId(projectId);
		ProjectContent projectCon = projectStatusService.selectOneProjectContentByProId(projectId);
		ProjectAccount projectAcc = projectStatusService.selectOneProjectAccountByProId(projectId);
		List<Product> prodList = projectStatusService.selectListProduct(projectId);
		
		System.out.println(project.getProject_name());
		
		model.addAttribute("project", project);
		model.addAttribute("projectCon", projectCon);
		model.addAttribute("projectAcc", projectAcc);
		model.addAttribute("prodList", prodList);
		
		return "projectStatus/grouppurUpdateView";
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
		
		//추가
		if(project.getTarget_amount() <= 0) {
			project.setTarget_amount(1);
		}
		
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
	public void updateProjectMethod(
			Project project,
			@RequestBody String param) throws Exception {
		
		System.out.println("[updateProject.do]");
		System.out.println("project]"+param);
		
		//web.xml에서 한글 인코딩 처리가 없으면
		//request.setCharacterEncoding("UTF-8");
		
		//전송 온 문자열을 json 객체로 변환 처리
		JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject)parser.parse(param);
		
		project.setProject_id((String)job.get("project_id"));
		project.setCategory_sub_id((String)job.get("category_sub_id"));
		project.setProject_name((String)job.get("project_name"));
		project.setRep_content((String)job.get("rep_content"));
		project.setRefund_role((String)job.get("refund_role"));
		project.setCertif_flag((String)job.get("certif_flag"));
		project.setProject_request_flag((String)job.get("request_flag"));
		
		//목표 금액
		int targetAmount = 0;
		String targetAmountStr = (String)job.get("target_amount");
		
		try {
			targetAmount = Integer.parseInt(targetAmountStr);
			
			//추가
			if(targetAmount <= 0) {
				targetAmount = 1;
			}
		} catch(NumberFormatException e) {
			System.out.println("targetAmount가 형변환안됨 :["+targetAmountStr);
			targetAmount = 1;
		}
		
		project.setTarget_amount(targetAmount);
		
		
		//마감일
		String endDateStr = (String)job.get("end_date");
		GregorianCalendar gcal = new GregorianCalendar();
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		
		
		Date date = null;
		Date paymentDate = null;
		
		try {
			gcal.setTime(sdf.parse(endDateStr));
			date = new Date(gcal.getTimeInMillis());
			
			gcal.add(Calendar.DATE, 7);
			
			paymentDate = new Date(gcal.getTimeInMillis());
			
		} catch(ParseException e) {
			date = null;
			paymentDate = null;
		}
	
		project.setEnd_date(date);
		project.setPayment_date(paymentDate);
	
		//DB에 update
		projectStatusService.updateProject(project);
		
		System.out.println("project 업데이트 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="insertProjectContent.do", method=RequestMethod.POST)
	public void insertProjectContenttMethod(
			ProjectContent projectCon,
			@RequestBody String param) throws Exception {
		
		System.out.println("[insertProjectContent.do]");
		System.out.println("ProjectContent:" + param);
		
		//web.xml에서 한글 인코딩 처리가 없으면
		//request.setCharacterEncoding("UTF-8");
		
		
		//전송 온 문자열을 json 객체로 변환 처리
		JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject)parser.parse(param);
		
		projectCon.setProject_id((String)job.get("project_id"));
		projectCon.setVideo_url((String)job.get("video_url"));
		projectCon.setContent((String)job.get("content"));
		
		
		//DB에 update
		projectStatusService.insertProjectContent(projectCon);
		
		System.out.println("projectContent 등록 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="updateProjectContent.do", method=RequestMethod.POST)
	public void updateProjectContentMethod(
			ProjectContent projectCon,
			@RequestBody String param) throws Exception {
		
		System.out.println("[updateProjectContent.do]");
		System.out.println("ProjectContent:" + param);
		
		//web.xml에서 한글 인코딩 처리가 없으면
		//request.setCharacterEncoding("UTF-8");
		
		//전송 온 문자열을 json 객체로 변환 처리
		JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject)parser.parse(param);
		
		projectCon.setProject_id((String)job.get("project_id"));
		projectCon.setVideo_url((String)job.get("video_url"));
		projectCon.setContent((String)job.get("content"));
		
		
		//DB에 update
		projectStatusService.updateProjectContent(projectCon);
		
		System.out.println("projectContent 업데이트 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="insertProjectAccount.do", method=RequestMethod.POST)
	public void insertProjectAccountMethod(
			ProjectAccount projectAcc,
			@RequestBody String param) throws Exception {
		
		System.out.println("[insertProjectAccount.do]");
		System.out.println("projectAccount:" + param);
		
		//web.xml에서 한글 인코딩 처리가 없으면
		//request.setCharacterEncoding("UTF-8");
		
		//전송 온 문자열을 json 객체로 변환 처리
		JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject)parser.parse(param);
		
		projectAcc.setProject_id((String)job.get("project_id"));
		projectAcc.setAccount_name((String)job.get("account_name"));
		projectAcc.setAccount_number((String)job.get("account_number"));
		
		String bankId = (String)job.get("bank_id");
		if(bankId.equals("선택하세요.")) {
			bankId = "";
		}
		projectAcc.setBank_id(bankId);
		
		
		//DB에 update
		projectStatusService.insertProjectAccount(projectAcc);
		
		System.out.println("projectAccount 등록 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="updateProjectAccount.do", method=RequestMethod.POST)
	public void updateProjectAccountMethod(
			ProjectAccount projectAcc,
			@RequestBody String param) throws Exception {
		
		System.out.println("[updateProjectAccount.do]");
		System.out.println("ProjectAccount:" + param);
		
		//web.xml에서 한글 인코딩 처리가 없으면
		//request.setCharacterEncoding("UTF-8");
		
		//전송 온 문자열을 json 객체로 변환 처리
		JSONParser parser = new JSONParser();
		JSONObject job = (JSONObject)parser.parse(param);
		
		projectAcc.setProject_id((String)job.get("project_id"));
		projectAcc.setBank_id((String)job.get("bank_id"));
		projectAcc.setAccount_name((String)job.get("account_name"));
		projectAcc.setAccount_number((String)job.get("account_number"));
		
		
		//DB에 update
		projectStatusService.updateProjectAccount(projectAcc);
		
		System.out.println("projectContent 업데이트 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="deleteGiftItem.do", method=RequestMethod.POST)
	public void removeGiftItemMethod(
			@RequestParam(value="projectId") String projectId) throws Exception {
		
		System.out.println("[deleteGiftItem.do]");
		System.out.println("projectId:" + projectId);
		
		//delete 
		projectStatusService.deleteGift(projectId);
		projectStatusService.deleteItem(projectId);
		System.out.println("gift, item 삭제 완료");
	}
	
	
	@ResponseBody
	@RequestMapping(value="insertGift.do", method=RequestMethod.POST)
	public void insertGiftMethod(@RequestBody String param) throws Exception{
		
		System.out.println("[insertGift.do]");
		System.out.println("Gift:" + param);
		
		JSONArray jarr = (JSONArray)new JSONParser().parse(param);
		System.out.println("insertGift] jarr size:" + jarr.size());
		
		for(int i=0; i<jarr.size(); ++i) {
			JSONObject job = (JSONObject)jarr.get(i);
			
			Gift gift = new Gift();
			gift.setGift_id((String)job.get("gift_id"));
			gift.setProject_id((String)job.get("project_id"));
			
			
			//후원금액
			int supportPrice = 0;
			String supportPriceStr = (String)job.get("support_price");
			
			try {
				supportPrice = Integer.parseInt(supportPriceStr);
			} catch(NumberFormatException e) {
				supportPrice = 0;
			}
			
			gift.setSupport_price(supportPrice);
			
			
			//최대수량
			int capacityCount = 0;
			String capacityCountStr = (String)job.get("capacity");
			
			try {
				capacityCount = Integer.parseInt(capacityCountStr);
			} catch(NumberFormatException e) {
				capacityCount = 0;
			}
			
			gift.setCapacity(capacityCount);
			
			//insert
			projectStatusService.insertGift(gift);
			
		}
		
		System.out.println("Gift 등록 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="insertItem.do", method=RequestMethod.POST)
	public void insertItemMethod(@RequestBody String param) throws Exception{
		
		System.out.println("[insertItem.do]");
		System.out.println("Item:" + param);
		
		JSONArray jarr = (JSONArray)new JSONParser().parse(param);
		System.out.println("insertItem] jarr size:" + jarr.size());
		
		for(int i=0; i<jarr.size(); ++i) {
			JSONObject job = (JSONObject)jarr.get(i);
			
			Item item = new Item();
			item.setItem_id((String)job.get("item_id"));
			item.setItem_name((String)job.get("item_name"));
			item.setProject_id((String)job.get("project_id"));
			
			//insert
			projectStatusService.insertItem(item);
		}
		
		System.out.println("Item 등록 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="insertGitfInItem.do", method=RequestMethod.POST)
	public void insertGitfInItemMethod(@RequestBody String param) throws Exception{
		
		System.out.println("[insertGitfInItem.do]");
		System.out.println("GiftInItem:" + param);
		
		JSONArray jarr = (JSONArray)new JSONParser().parse(param);
		System.out.println("insertGitfInItem] jarr size:" + jarr.size());
		
		for(int i=0; i<jarr.size(); ++i) {
			JSONObject job = (JSONObject)jarr.get(i);
			
			GiftInItems giftInItem = new GiftInItems();
			giftInItem.setGift_id((String)job.get("gift_id"));
			giftInItem.setItem_id((String)job.get("item_id"));
			
			int count = 0;
			String countStr = (String)job.get("count");
			
			try {
				count = Integer.parseInt(countStr);
			} catch(NumberFormatException e) {
				count = 0;
			}
			giftInItem.setCount(count);
	
			
			//insert
			projectStatusService.insertGiftInItem(giftInItem);
		}
		
		System.out.println("GiftInItem 등록 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="insertProduct.do", method=RequestMethod.POST)
	public void insertProductMethod(@RequestBody String param) throws Exception{
		
		System.out.println("[insertProduct.do]");
		System.out.println("Product:" + param);
		
		JSONArray jarr = (JSONArray)new JSONParser().parse(param);
		System.out.println("insertProduct] jarr size:" + jarr.size());
		
		for(int i=0; i<jarr.size(); ++i) {
			JSONObject job = (JSONObject)jarr.get(i);
			
			Product product = new Product();
	
			product.setProduct_id((String)job.get("product_id"));
			product.setProduct_name((String)job.get("product_name"));
			product.setProject_id((String)job.get("project_id"));
		
			//가격
			int price = 0;
			String priceStr = (String)job.get("product_price");
			
			try {
				price = Integer.parseInt(priceStr);
			} catch(NumberFormatException e) {
				price = 0;
			}
		
			product.setProduct_price(price);
			

			//최소 구매량
			int mincount = 0;
			String mincountStr = (String)job.get("mincount");
			
			try {
				mincount = Integer.parseInt(mincountStr);
			} catch(NumberFormatException e) {
				mincount = 0;
			}
		
			product.setMincount(mincount);
			
			
			//insert
			projectStatusService.insertProduct(product);
			
		}
		
		System.out.println("Product 등록 완료");
	}
	
	@ResponseBody
	@RequestMapping(value="deleteProduct.do", method=RequestMethod.POST)
	public void deleteProductMethod(
			@RequestParam(value="projectId") String projectId) throws Exception {
		
		System.out.println("[deleteProduct.do]");
		System.out.println("projectId:" + projectId);
		
		//delete 
		projectStatusService.deleteProduct(projectId);
	
		System.out.println("product 삭제 완료");
	}
	
	
	//-------------------------------------------------
	//이메일 인증
	//-------------------------------------------------
	@ResponseBody
	@RequestMapping(value="projectAjaxSendEmailAuthCode.do", method=RequestMethod.POST)
	public String sendEmail(@RequestParam(value="Email") String email,
						  HttpServletResponse response)  throws ServletException, IOException {
		
		int num = (int)(Math.random()*8999)+1001;
		char ch = (char)((Math.random() * 26) + 65);
		char ch2 = (char)((Math.random() * 26) + 65);
		
		String code=""+num+ch+ch2;
		
		String m_name = "Cornsalad";
		String m_title = "Cornsalad 프로젝트 등록 이메일 인증메일 발송";
		String m_text = "";
		
		m_text = "안녕하십니까. 프로젝트 등록 인증 번호 메일입니다.\n"
				+ "저희 Cornsalad를 이용해 주시는 회원님께 감사의 말씀 드립니다.\n"
				+ "Cornsalad는 고객 만족을 위해 최선을 다하고 있습니다.\n"
				+ "불편사항이 있으시다면 언제든지 저희 1:1문의를 이용해 주십시오. 감사합니다.\n"
				+ "\n"
				+ "회원님의 메일 인증 코드는  " + code + " 입니다";
		
		String d_email = "cornsalad00@gmail.com";
		
		
		try {
			String mail_from = m_name + "<" + d_email + ">";
			String mail_to = email;
			String title = m_title;
	
			mail_from = new String(mail_from.getBytes("UTF-8"), "UTF-8");
			mail_to = new String(mail_to.getBytes("UTF-8"), "UTF-8");
			
			Properties props = new Properties();
			
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.user", d_email);
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.socketFactory.fallback", "false");
			
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getDefaultInstance(props, auth);
			
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(d_email));
			msg.setSubject(title, "UTF-8");
			msg.setText(m_text);
			msg.setHeader("Content-type", "text/html; charset=UTF-8");
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(email));			
			Transport.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		JSONObject job = new JSONObject();
		job.put("code", "SUSS000");
		job.put("message",code);
		
		return job.toJSONString();
	}
	
	@RequestMapping(value="projectAjaxIsValidToken.do")
	public void ajaxIsValidToken(@RequestParam(value="token") String token,
								 @RequestParam(value="secureStateBagKey") String secureStateBagKey,
								 HttpServletResponse response) throws IOException{
		
		
		PrintWriter out = response.getWriter();
		
		if(token.equals(secureStateBagKey)) {
			out.append("SUSS000");
		}else {
			out.append("");
		}
		
		out.flush();
		out.close();
	}
	
	
}




