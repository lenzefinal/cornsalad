package com.devone.finalp.member_status.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.member_status.model.dao.MemberStatusDao;

@Service("memberStatusService")
public class MemberStatusServiceImpl implements MemberStatusService {
	
	@Autowired
	private MemberStatusDao memberStatusDao;

	@Override
	public Member login(Member member) {
		return memberStatusDao.login(member);
	}

	@Override
	public Member joinedEmailFind(String email) {
		return memberStatusDao.joinedEmailFind(email);
	}

	@Override
	public int insertMember(Member member) {
		return memberStatusDao.insertMember(member);
	}

	@Override
	public int updateTime(Member member) {
		return memberStatusDao.updateTime(member);
		
	}

	@Override
	public int insertMemberReportCount(String member_id) {
		return memberStatusDao.insertMemberReportCount(member_id);
	}



}
