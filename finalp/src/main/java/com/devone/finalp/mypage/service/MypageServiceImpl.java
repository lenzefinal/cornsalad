package com.devone.finalp.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.common.model.vo.Question;
import com.devone.finalp.common.model.vo.QuestionCategory;
import com.devone.finalp.mypage.model.dao.MypageDao;
import com.devone.finalp.mypage.model.vo.MemberAccount;
import com.devone.finalp.mypage.model.vo.MyLikes;
import com.devone.finalp.mypage.model.vo.MyQuestion;
import com.devone.finalp.mypage.model.vo.PurchaseProduct;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDao mypageDao;
	
	//회원 정보 수정
	public int memberModify(Member member) {
		return mypageDao.memberModify(member);
	}
	
	//회원 탈퇴
	@Override
	public int memberDelete(Member member) {
		return mypageDao.memberDelete(member);
	}
	@Override
	public Member selectMember(Member member) {
		return mypageDao.selectMember(member);
	}
	@Override
	public MemberAccount selectAccount(MemberAccount account) {
		return mypageDao.selectAccount(account);
	}
	@Override
	public List<Bank> bankList() {
		return mypageDao.bankList();
	}
	@Override
	public int accountModify(MemberAccount account) {
		return mypageDao.accountModify(account);
	}
	@Override
	public List<Project> selectMyProject(Project project) {
		return mypageDao.selectMyProject(project);
	}
	@Override
	public List<Project> selectMyProduct(Project project) {
		return mypageDao.selectMyProduct(project);
	}

	@Override
	public List<MyLikes> selectLikesProject(MyLikes projectLikes) {
		
		return mypageDao.selectProjectLikes(projectLikes);
	}

	@Override
	public List<MyLikes> selectLikesProduct(MyLikes productLikes) {
		// TODO Auto-generated method stub
		return mypageDao.selectProductLikes(productLikes);
	}
	@Override
	public int projectCount(String member_id) {
		return mypageDao.projectCount(member_id);
	}
	@Override
	public int productCount(String member_id) {
		return mypageDao.productCount(member_id);
	}

	@Override
	public int lprojectCount(String member_id) {
		// TODO Auto-generated method stub
		return mypageDao.lprojectCount(member_id);
	}

	@Override
	public int lproductCount(String member_id) {
		// TODO Auto-generated method stub
		return mypageDao.lproductCount(member_id);
	}

	@Override
	public List<PurchaseProduct> selectPurchaseProduct(PurchaseProduct product) {
		// TODO Auto-generated method stub
		return mypageDao.selectpurchaseProduct(product);
	}

	@Override
	public int pproductCount(String member_id) {
		// TODO Auto-generated method stub
		return mypageDao.pproductCount(member_id);
	}

	@Override
	public List<Project> selectSearchMyProject(Project project) {
		// TODO Auto-generated method stub
		return mypageDao.selectSearchMyProject(project);
	}
	
	@Override
	public List<Project> selectSearchMyProduct(Project product) {
		// TODO Auto-generated method stub
		return mypageDao.selectSearchMyProduct(product);
	}

	@Override
	public List<MyLikes> selectSearchProjectLikes(MyLikes projectLikes) {
		// TODO Auto-generated method stub
		return mypageDao.selectSearchProjectLikes(projectLikes);
	}
	@Override
	public List<MyLikes> selectSearchProductLikes(MyLikes productLikes) {
		// TODO Auto-generated method stub
		return mypageDao.selectSearchProductLikes(productLikes);
	}
	@Override
	public List<PurchaseProduct> searchPurchaseProduct(PurchaseProduct purchaseProduct) {
		// TODO Auto-generated method stub
		return mypageDao.searchPurchaseProduct(purchaseProduct);
	}

	@Override
	public int insertQuestion(MyQuestion q) {
		// TODO Auto-generated method stub
		return mypageDao.insertQuestion(q);
	}

	@Override
	public List<QuestionCategory> questionCategory() {
		// TODO Auto-generated method stub
		return mypageDao.questionCategory();
	}

	@Override
	public List<MyQuestion> myQuestionList(MyQuestion q) {
		// TODO Auto-generated method stub
		return mypageDao.myQuestionList(q);
	}

	@Override
	public MyQuestion myQdetail(int questionid) {
		// TODO Auto-generated method stub
		return mypageDao.myQdetail(questionid);
	}

	@Override
	public MyQuestion receiveQdetail(int questionid) {
		// TODO Auto-generated method stub
		return mypageDao.receiveQdetail(questionid);
	}

	@Override
	public List<MyQuestion> myRQuestionList(MyQuestion q) {
		// TODO Auto-generated method stub
		return mypageDao.myRQeustionList(q);
	}

	@Override
	public MyQuestion rmyQdetail(int questionid) {
		// TODO Auto-generated method stub
		return mypageDao.rmyQdetail(questionid);
	}

	@Override
	public int receiveQ(MyQuestion q) {
		// TODO Auto-generated method stub
		System.out.println("서비스 "+q);
		return mypageDao.receiveQ(q);
	}
}
