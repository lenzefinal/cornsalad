package com.devone.finalp.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Member;

@Repository("mypageDao")
public class MypageDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int memberDelete(Member member) {
		return mybatis.delete("memberMapper.deleteMember", member);
	}

	public int memberModify(Member member) {
		
		return mybatis.update("memberMapper.modifyMember", member);
	}
}
