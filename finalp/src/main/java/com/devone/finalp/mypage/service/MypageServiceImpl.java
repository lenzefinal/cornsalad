package com.devone.finalp.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.memberaccount.model.vo.MemberAccount;
import com.devone.finalp.mypage.model.dao.MypageDao;

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
	public List bankList() {
		return mypageDao.bankList();
	}
	@Override
	public int accountModify(MemberAccount account) {
		return mypageDao.accountModify(account);
	}
}
