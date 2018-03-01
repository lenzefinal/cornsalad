package com.devone.finalp.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public Member login(Member member) {
		return mybatis.selectOne("memberMapper.login", member);
	}

}
