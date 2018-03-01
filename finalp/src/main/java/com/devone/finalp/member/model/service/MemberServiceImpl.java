package com.devone.finalp.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.member.model.dao.MemberDao;
import com.devone.finalp.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member login(Member member) {
		return memberDao.login(member);
	}



}
