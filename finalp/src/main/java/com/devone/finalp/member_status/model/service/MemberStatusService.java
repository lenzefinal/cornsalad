package com.devone.finalp.member_status.model.service;

import com.devone.finalp.common.model.vo.Member;

public interface MemberStatusService {

	Member login(Member member);
	Member joinedEmailFind(String email);
	
	int insertMember(Member member);
}
