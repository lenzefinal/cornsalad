﻿package com.devone.finalp.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.mypage.model.vo.MemberAccount;
import com.devone.finalp.mypage.model.vo.MyLikes;
import com.devone.finalp.mypage.model.vo.PurchaseProduct;
import com.devone.finalp.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;

	// 폼 출력 메소드
	// 마이페이지 메인
	@RequestMapping("mypageIndex.do")
	public String mypageIndex(Model model, Member member, @RequestParam(value = "member_id") String member_id) {

		System.out.println("마이페이지 인덱스 Form");
		System.out.println(System.currentTimeMillis());
		model.addAttribute("projectCount", mypageService.projectCount(member_id));
		model.addAttribute("productCount", mypageService.productCount(member_id));
		model.addAttribute("lprojectCount", mypageService.lprojectCount(member_id));
		model.addAttribute("lproductCount", mypageService.lproductCount(member_id));
		model.addAttribute("pproductCount", mypageService.pproductCount(member_id));

		return "mypage/mypageIndex";
	}

	// 마이페이지 회원 정보 수정 폼
	@RequestMapping("mypageModify.do")
	public String mypageModify(Member member, Model model, MemberAccount account) {
		System.out.println("정보 수정 Form");
		model.addAttribute("member", mypageService.selectMember(member));
		System.out.println("수정폼 "+member);
		model.addAttribute("bank", mypageService.bankList());
		model.addAttribute("account", mypageService.selectAccount(account));
		return "mypage/mypageModify";
	}

	// 마이페이지 회원 탈퇴 폼
	@RequestMapping("mypageWithdrawal.do")
	public String mypageWithdrawal() {
		System.out.println("회원 탈퇴 Form");

		return "mypage/mypageWithdrawal";
	}

	// 등록한 프로젝트 리스트 출력 폼
	@RequestMapping("myProject.do")
	public String myProject(Model model, Project project) {
		System.out.println("등록 프로젝트 Form");
		System.out.println(model);

		return "mypage/myProject";
	}

	// 등록한 공동구매 상품 리스트 출력 폼
	@RequestMapping("myProduct.do")
	public String myProduct() {
		System.out.println("등록 공동구매 Form");

		return "mypage/myProduct";
	}

	// 펀딩한 프로젝트 리스트 출력 폼
	@RequestMapping("fundingProject.do")
	public String fundingProject() {
		System.out.println("펀딩 프로젝트 Form");

		return "mypage/fundingProject";
	}

	// 구매 신청한 공동구매 리스트 출력 폼
	@RequestMapping("purchaseProduct.do")
	public String purchaseProduct() {
		System.out.println("구매 공동구매 Form");

		return "mypage/purchaseProduct";
	}

	// 찜한 프로젝트 리스트 출력 폼
	@RequestMapping("projectLikes.do")
	public String projectLikes() {
		System.out.println("찜 프로젝트 Form");

		return "mypage/projectLikes";
	}

	// 찜한 공동구매 리스트 출력 폼
	@RequestMapping("productLikes.do")
	public String productLikes() {
		System.out.println("찜 공동구매 Form");

		return "mypage/productLikes";
	}

	// 기능 메소드
	// 회원 탈퇴 기능
	@RequestMapping("mDelete.do")
	public String memberDelete(Member member, Model model) {
		System.out.println("탈퇴: " + member);
		model.addAttribute("member", mypageService.memberDelete(member));

		System.out.println("회원 탈퇴 완료");
		return "redirect:logout.do";
	}

	// 회원 정보 수정 기능
	@RequestMapping("mModify.do")
	public String memberModify(Model model, Member member, MemberAccount account,
			@RequestParam(value = "orifile") String orifile, @RequestParam(value = "refile") String refile,
			HttpServletRequest request) throws IOException {

		// 파일 업로드 처리
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile uploadFile = multipartRequest.getFile("memberProfile");

		// 웹서버 컨테이너 경로 추출함
		String root = request.getSession().getServletContext().getRealPath("resources/");
		// 파일 저장 경로 정함
		String savePath = root + "images/mypageProfiles/";
		// 스프링에서는 프로젝트\target\m2e-wtp\web-resources\ 아래에 폴더를 만들어야 함
		if (!uploadFile.isEmpty()) {
			String ofileName = uploadFile.getOriginalFilename();

			long currentTime = System.currentTimeMillis();
			SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rfileName = simDf.format(new Date(currentTime)) + "."
					+ ofileName.substring(ofileName.lastIndexOf(".") + 1);
			;
			uploadFile.transferTo(new File(savePath + rfileName));

			member.setProfile_img_oriname(ofileName);
			member.setProfile_img_rename(rfileName);
		} else {
			if (orifile != null && refile != null) {
				member.setProfile_img_oriname(orifile);
				member.setProfile_img_rename(refile);
			} else {
				member.setProfile_img_oriname(null);
				member.setProfile_img_rename(null);
			}
		}
		mypageService.memberModify(member);
		mypageService.accountModify(account);
		System.out.println("수정: " + member);
		System.out.println("account:" + account);

		return "redirect:mypageIndex.do?member_id="+member.getMember_id();
	}

	// 등록한 프로젝트 리스트 출력
	@RequestMapping(value = "myProjectList.do", method = RequestMethod.POST)
	public void myProjectList(Project project, HttpServletResponse response) throws IOException {
		System.out.println("등록 프로젝트 list");
		List<Project> list = mypageService.selectMyProject(project);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Project p : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", p.getImage_rename());
			j.put("project_name", p.getProject_name());
			j.put("member_id", p.getMember_id());
			j.put("creation_date", p.getCreation_date().toString());
			j.put("end_date", p.getEnd_date().toString());
			jarr.add(j);
		}
		json.put("project", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 등록한 공동구매 상품 리스트 출력
	@RequestMapping(value = "myProductList.do", method = RequestMethod.POST)
	public void myProductList(Project product, HttpServletResponse response) throws IOException {
		System.out.println("등록 공동구매 list");
		List<Project> list = mypageService.selectMyProduct(product);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Project p : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", p.getImage_rename());
			j.put("project_name", p.getProject_name());
			j.put("member_id", p.getMember_id());
			j.put("creation_date", p.getCreation_date().toString());
			j.put("end_date", p.getEnd_date().toString());
			jarr.add(j);

		}
		json.put("product", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 구매한 공동구매 상품 리스트 출력
	@RequestMapping(value = "purchaseProductList.do", method = RequestMethod.POST)
	public void purchaseProductList(PurchaseProduct product, HttpServletResponse response) throws IOException {
		System.out.println("구매 공동구매 list");
		List<PurchaseProduct> list = mypageService.selectPurchaseProduct(product);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (PurchaseProduct p : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", p.getImage_rename());
			j.put("project_name", p.getProject_name());
			j.put("product_name", p.getProduct_name());
			j.put("total_amount", p.getTotal_amount());
			j.put("total_count", p.getTotal_count());
			j.put("member_id", p.getMember_id());
			j.put("payment_date", p.getPayment_date().toString());
			j.put("end_date", p.getEnd_date().toString());
			jarr.add(j);

		}
		json.put("pproduct", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();

	}

	// 찜한 프로젝트 리스트 출력 메소드
	@RequestMapping(value = "lProjectList.do", method = RequestMethod.POST)
	public void ProjectLikes(MyLikes projectLikes, HttpServletResponse response) throws IOException {
		System.out.println("찜한 프로젝트 list");
		List<MyLikes> list = mypageService.selectLikesProject(projectLikes);
		response.setContentType("application/json; charset=utf-8");
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (MyLikes lpj : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", lpj.getImage_rename());
			j.put("project_name", lpj.getProject_name());
			j.put("member_id", lpj.getMember_id());
			j.put("creation_date", lpj.getCreation_date().toString());
			j.put("end_date", lpj.getEnd_date().toString());
			jarr.add(j);

		}
		json.put("lproject", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 찜한 공동구매 상품 리스트 출력 메소드
	@RequestMapping(value = "lProductList.do", method = RequestMethod.POST)
	public void ProductLikes(MyLikes productLikes, HttpServletResponse response) throws IOException {
		System.out.println("찜한 프로젝트 list");
		List<MyLikes> list = mypageService.selectLikesProduct(productLikes);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (MyLikes lpd : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", lpd.getImage_rename());
			j.put("project_name", lpd.getProject_name());
			j.put("member_id", lpd.getMember_id());
			j.put("creation_date", lpd.getCreation_date().toString());
			j.put("end_date", lpd.getEnd_date().toString());
			jarr.add(j);

		}
		json.put("lproduct", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 등록 프로젝트 검색 기능
	@RequestMapping(value = "searchmyproject.do", method = RequestMethod.POST)
	public void SearchMyProject(Project project, HttpServletResponse response) throws IOException {
		System.out.println("등록 프로젝트 검색 list");
		List<Project> list = mypageService.selectSearchMyProject(project);
		System.out.println("ddf");
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Project p : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", p.getImage_rename());
			j.put("project_name", p.getProject_name());
			j.put("member_id", p.getMember_id());
			j.put("creation_date", p.getCreation_date().toString());
			j.put("end_date", p.getEnd_date().toString());
			jarr.add(j);
		}
		json.put("smproject", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 등록 공동구매 검색 기능
	@RequestMapping(value = "searchmyproduct.do", method = RequestMethod.POST)
	public void SearchMyProduct(Project product, HttpServletResponse response) throws IOException {
		System.out.println("등록 공동구매 검색 list");
		List<Project> list = mypageService.selectSearchMyProduct(product);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (Project p : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", p.getImage_rename());
			j.put("project_name", p.getProject_name());
			j.put("member_id", p.getMember_id());
			j.put("creation_date", p.getCreation_date().toString());
			j.put("end_date", p.getEnd_date().toString());
			jarr.add(j);
		}
		json.put("smproduct", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 찜 프로젝트 검색 기능
	@RequestMapping(value = "searchprojectlikes.do", method = RequestMethod.POST)
	public void SearchProjectLikes(MyLikes projectLikes, HttpServletResponse response) throws IOException {
		System.out.println("찜 프로젝트 검색 list");
		List<MyLikes> list = mypageService.selectSearchProjectLikes(projectLikes);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (MyLikes lpj : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", lpj.getImage_rename());
			j.put("project_name", lpj.getProject_name());
			j.put("member_id", lpj.getMember_id());
			j.put("creation_date", lpj.getCreation_date().toString());
			j.put("end_date", lpj.getEnd_date().toString());
			jarr.add(j);
		}
		json.put("slproject", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}

	// 찜 공동구매 검색 기능
	@RequestMapping(value = "searchproductlikes.do", method = RequestMethod.POST)
	public void SearchProductLikes(MyLikes productLikes, HttpServletResponse response) throws IOException {
		System.out.println("찜 프로젝트 검색 list");
		List<MyLikes> list = mypageService.selectSearchProductLikes(productLikes);
		response.setContentType("application/json; charset=utf-8");

		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();

		for (MyLikes lpd : list) {
			JSONObject j = new JSONObject();
			j.put("image_rename", lpd.getImage_rename());
			j.put("project_name", lpd.getProject_name());
			j.put("member_id", lpd.getMember_id());
			j.put("creation_date", lpd.getCreation_date().toString());
			j.put("end_date", lpd.getEnd_date().toString());
			jarr.add(j);
		}
		json.put("slproduct", jarr);
		System.out.println(json.toJSONString());

		PrintWriter out = response.getWriter();
		out.println(json.toJSONString());
		out.flush();
		out.close();
	}
	
	// 구매한 공동구매 상품 리스트 출력
		@RequestMapping(value = "searchpurchaseproduct.do", method = RequestMethod.POST)
		public void searchPurchaseProduct(PurchaseProduct purchaseProduct, HttpServletResponse response) throws IOException {
			System.out.println("구매 공동구매 list");
			List<PurchaseProduct> list = mypageService.searchPurchaseProduct(purchaseProduct);
			response.setContentType("application/json; charset=utf-8");

			JSONObject json = new JSONObject();
			JSONArray jarr = new JSONArray();

			for (PurchaseProduct p : list) {
				JSONObject j = new JSONObject();
				j.put("image_rename", p.getImage_rename());
				j.put("project_name", p.getProject_name());
				j.put("product_name", p.getProduct_name());
				j.put("total_amount", p.getTotal_amount());
				j.put("total_count", p.getTotal_count());
				j.put("member_id", p.getMember_id());
				j.put("payment_date", p.getPayment_date().toString());
				j.put("end_date", p.getEnd_date().toString());
				jarr.add(j);

			}
			json.put("spproduct", jarr);
			System.out.println(json.toJSONString());

			PrintWriter out = response.getWriter();
			out.println(json.toJSONString());
			out.flush();
			out.close();

		}
}
