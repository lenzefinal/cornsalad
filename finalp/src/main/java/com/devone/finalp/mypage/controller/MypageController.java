package com.devone.finalp.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.memberaccount.model.vo.MemberAccount;
import com.devone.finalp.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService mypageService;

	// 마이페이지 메인
	@RequestMapping("mypageIndex.do")
	public String mypageIndex() {
		System.out.println("마이페이지 인덱스");

		return "mypage/mypageIndex";
	}

	// 마이페이지 회원 정보 수정 폼
	@RequestMapping("mypageModify.do")
	public String mypageModify(Member member ,Model model, MemberAccount account, Bank bank) {
		System.out.println("정보수정폼 멤버: "+member);
		System.out.println("정보수정폼 은행: "+bank);
		System.out.println("정보수정폼 계좌: "+account);
		model.addAttribute("member",mypageService.selectMember(member));
		model.addAttribute("bank", mypageService.selectBank(bank));
		model.addAttribute("account", mypageService.selectAccount(account));

		return "mypage/mypageModify";
	}

	// 마이페이지 회원 탈퇴 폼
	@RequestMapping("mypageWithdrawal.do")
	public String mypageWithdrawal() {
		System.out.println("회원 탈퇴 폼");

		return "mypage/mypageWithdrawal";
	}

	// 마이페이지 찜 리스트(default:찜한 프로젝트 리스트 출력)
	@RequestMapping("mypageLikes.do")
	public String mypageLikes() {
		System.out.println("찜한 거 보기");

		return "mypage/mypageLikes";
	}

	// 마이페이지 현황보기(default:등록한 프로젝트 리스트 출력)
	@RequestMapping("mypageStatus.do")
	public String mypageStatus() {
		System.out.println("현황 보기");

		return "mypage/mypageStatus";
	}

	// 등록한 프로젝트 리스트 출력 폼
	@RequestMapping("myProject.do")
	public String myProject() {
		System.out.println("등록 프로젝트");

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
	
	//회원 정보 수정 기능
	@RequestMapping("mModify.do")
	public String memberModify(Model model, Member member, MemberAccount account) {
		System.out.println("기능: "+member);
		int result=mypageService.memberModify(member);
		System.out.println("result:"+result);
		mypageService.accountModify(account);
		
		return "redirect:mypageIndex.do";
	}

	// 회원 탈퇴 기능
	@RequestMapping("mDelete.do")
	public String memberDelete(Member member, Model model) {
		System.out.println("기능: "+member);
		model.addAttribute("member",mypageService.memberDelete(member));
		
		System.out.println("회원 탈퇴 완료");
		return "redirect:logout.do";
	}
}
