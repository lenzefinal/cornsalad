package com.devone.finalp.mypage.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.MemberTrust;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.QuestionCategory;
import com.devone.finalp.mypage.model.vo.FundingProject;
import com.devone.finalp.mypage.model.vo.MemberAccount;
import com.devone.finalp.mypage.model.vo.MyFundPay;
import com.devone.finalp.mypage.model.vo.MyLikes;
import com.devone.finalp.mypage.model.vo.MyProdPay;
import com.devone.finalp.mypage.model.vo.MyQuestion;
import com.devone.finalp.mypage.model.vo.PurchaseProduct;

public interface MypageService {
	int memberModify(Member member);
	int memberDelete(Member member);
	Member selectMember(Member member);
	MemberAccount selectAccount(MemberAccount account);
	List<Bank> bankList();
	int accountModify(MemberAccount account);
	List<Project> selectMyProject(Project project);
	List<Project> selectMyProduct(Project product);
	List<MyLikes> selectLikesProject(MyLikes projectLikes);
	List<MyLikes> selectLikesProduct(MyLikes productLikes);
	int projectCount(String member_id);
	int productCount(String member_id);
	int lprojectCount(String member_id);
	int lproductCount(String member_id);
	List<PurchaseProduct> selectPurchaseProduct(PurchaseProduct product);
	int pproductCount(String member_id);
	int fprojectCount(String member_id);
	List<Project> selectSearchMyProject(Project project);
	List<Project> selectSearchMyProduct(Project product);
	List<MyLikes> selectSearchProjectLikes(MyLikes projectLikes);
	List<MyLikes> selectSearchProductLikes(MyLikes productLikes);
	List<PurchaseProduct> searchPurchaseProduct(PurchaseProduct purchaseProduct);
	int insertQuestion(MyQuestion q);
	List<QuestionCategory> questionCategory();
	List<MyQuestion> myQuestionList(MyQuestion q);
	MyQuestion myQdetail(int questionid);
	MyQuestion receiveQdetail(int questionid);
	List<MyQuestion> myRQuestionList(MyQuestion q);
	MyQuestion rmyQdetail(int questionid);
	int receiveQ(MyQuestion q);
	List<FundingProject> selectFundingProject(FundingProject project);
	List<FundingProject> searchFundingProject(FundingProject fundingProject);
	List<MyProdPay> myProdpay(MyProdPay prodpay);
	List<MyFundPay> myFundpay(MyFundPay fundpay);
	MemberTrust selectOneMemberTrust(MemberTrust memberTrust);
	int insertMemberTrust(MemberTrust memberTrust);
	int updateMemberTrust(MemberTrust memberTrust);
	List<MemberTrust> selectListMemberTrustByMemberId(String memberId);
	
}
