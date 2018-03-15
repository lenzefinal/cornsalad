package com.devone.finalp.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.memberaccount.model.vo.MemberAccount;
import com.devone.finalp.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;

	// 마이페이지 메인
	@RequestMapping("mypageIndex.do")
	public String mypageIndex(Model model, Member member) {

		System.out.println("마이페이지 인덱스");

		return "mypage/mypageIndex";
	}

	// 마이페이지 회원 정보 수정 폼
	@RequestMapping("mypageModify.do")
	public String mypageModify(Member member, Model model, MemberAccount account) {
		System.out.println("정보수정폼 멤버: " + member);
		System.out.println("정보수정폼 계좌: " + account);
		model.addAttribute("member", mypageService.selectMember(member));
		model.addAttribute("bank", mypageService.bankList());
		model.addAttribute("account", mypageService.selectAccount(account));
		System.out.println("정보수정폼 계좌: " + account);
		return "mypage/mypageModify";
	}

	// 마이페이지 회원 탈퇴 폼
	@RequestMapping("mypageWithdrawal.do")
	public String mypageWithdrawal() {
		System.out.println("회원 탈퇴 폼");

		return "mypage/mypageWithdrawal";
	}

	// 등록한 프로젝트 리스트 출력 폼
	@RequestMapping("myProject.do")
	public String myProject(Model model, Project project) {
		System.out.println("등록 프로젝트");
		model.addAttribute("project", mypageService.selectMyProject(project));
		return "mypage/myProject";
	}

	// 등록한 공동구매 상품 리스트 출력 폼
	@RequestMapping("myProduct.do")
	public String myProduct() {
		System.out.println("등록 공구");

		return "mypage/myProduct";
	}

	// 펀딩한 프로젝트 리스트 출력 폼
	@RequestMapping("fundingProject.do")
	public String fundingProject() {
		System.out.println("펀딩 프로젝트");

		return "mypage/fundingProject";
	}

	// 구매 신청한 공동구매 리스트 출력 폼
	@RequestMapping("purchaseProduct.do")
	public String purchaseProduct() {
		System.out.println("구매 공구");

		return "mypage/purchaseProduct";
	}

	// 찜한 프로젝트 리스트 출력 폼
	@RequestMapping("projectLikes.do")
	public String projectLikes() {
		System.out.println("찜 프로젝트");

		return "mypage/projectLikes";
	}

	// 찜한 공동구매 리스트 출력 폼
	@RequestMapping("productLikes.do")
	public String productLikes() {
		System.out.println("찜 공구");

		return "mypage/productLikes";
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

		return "redirect:mypageIndex.do";
	}

	// 회원 탈퇴 기능
	@RequestMapping("mDelete.do")
	public String memberDelete(Member member, Model model) {
		System.out.println("탈퇴: " + member);
		model.addAttribute("member", mypageService.memberDelete(member));

		System.out.println("회원 탈퇴 완료");
		return "redirect:logout.do";
	}
}
