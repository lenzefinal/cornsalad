package com.devone.finalp.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Bank;
import com.devone.finalp.common.model.vo.Member;
import com.devone.finalp.common.model.vo.Project;
import com.devone.finalp.mypage.model.vo.MemberAccount;
import com.devone.finalp.mypage.model.vo.MyLikes;

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

	public List<MyLikes> selectProjectLikes(MyLikes projectLikes) {
		// TODO Auto-generated method stub
		return mybatis.selectList("mystatusmapper.projectLikes", projectLikes);
	}

	public List<MyLikes> selectProductLikes(MyLikes productLikes) {
		// TODO Auto-generated method stub
		return mybatis.selectList("mystatusmapper.productLikes", productLikes);
	}

	public int projectCount(String member_id) {
		return mybatis.selectOne("mystatusmapper.projectCount", member_id);
	}

	public int productCount(String member_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("mystatusmapper.productCount", member_id);
	}

	public int lprojectCount(String member_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("mystatusmapper.lprojectCount", member_id);
	}

	public int lproductCount(String member_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("mystatusmapper.lproductCount", member_id);
	}
}
