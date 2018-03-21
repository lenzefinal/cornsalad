package com.devone.finalp.member_status.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Member;

@Repository("memberStatusDao")
public class MemberStatusDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public Member login(Member member) {
		return mybatis.selectOne("memberMapper.login", member);
	}
	
	public Member joinedEmailFind(String email) {
		return mybatis.selectOne("memberMapper.joinedEmailFind", email);
	}
	
	public int insertMember(Member member) {
		return mybatis.insert("memberMapper.insertMember", member);
	}

	public int updateTime(Member member) {
			   mybatis.update("memberMapper.updateTime", member);
		return mybatis.update("memberMapper.updateTime1",member);
	}

}
