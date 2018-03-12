package com.devone.finalp.mypage.service;

import java.util.List;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.memberaccount.model.vo.MemberAccount;

public interface MypageService {
	int memberModify(Member member);
	int memberDelete(Member member);
	Member selectMember(Member member);
	MemberAccount selectAccount(MemberAccount account);
	List selectBank(Bank bank);
	int accountModify(MemberAccount account);
}
