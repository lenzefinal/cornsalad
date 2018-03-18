package com.devone.finalp.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.memberaccount.model.vo.MemberAccount;

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

	public Member selectMember(Member member) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("memberMapper.memberInfo", member);
	}

	public MemberAccount selectAccount(MemberAccount account) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("accountMapper.accountInfo", account);
	}

	public List bankList() {
		// TODO Auto-generated method stub
		return mybatis.selectList("accountMapper.bankInfo");
	}

	public int accountModify(MemberAccount account) {
		// TODO Auto-generated method stub
		return mybatis.update("accountMapper.modifyAccount", account);
	}

	public List selectMyProject(Project project) {
		// TODO Auto-generated method stub
		return mybatis.selectList("mystatusmapper.myProject", project);
	}
	
	public List selectMyProduct(Project project) {
		return mybatis.selectList("mystatusmapper.myProduct", project);
	}
}
