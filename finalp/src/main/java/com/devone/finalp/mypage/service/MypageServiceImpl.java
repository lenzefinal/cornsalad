package com.devone.finalp.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.mypage.model.dao.MypageDao;
import com.devone.finalp.mypage.model.vo.MemberAccount;
import com.devone.finalp.mypage.model.vo.MyLikes;

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
}
