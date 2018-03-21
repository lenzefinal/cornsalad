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
import com.devone.finalp.mypage.model.vo.PurchaseProduct;

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

	public List<PurchaseProduct> selectpurchaseProduct(PurchaseProduct product) {
		// TODO Auto-generated method stub
		return mybatis.selectList("mystatusmapper.purchaseProduct", product);
	}

	public int pproductCount(String member_id) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("mystatusmapper.pproductCount", member_id);
	}

	public List<Project> selectSearchMyProject(Project project) {
		String keyword = "%" + project.getProject_name() + "%";
		project.setProject_name(keyword);
		return mybatis.selectList("mystatusmapper.searchMyproject", project);
	}
	
	public List<Project> selectSearchMyProduct(Project product) {
		String keyword = "%" + product.getProject_name() + "%";
		product.setProject_name(keyword);
		return mybatis.selectList("mystatusmapper.searchMyproduct", product);
	}

	public List<MyLikes> selectSearchProjectLikes(MyLikes projectLikes) {
		String keyword = "%" + projectLikes.getProject_name() + "%";
		projectLikes.setProject_name(keyword);
		return mybatis.selectList("mystatusmapper.searchProjectLikes", projectLikes);
	}
	public List<MyLikes> selectSearchProductLikes(MyLikes productLikes) {
		String keyword = "%" + productLikes.getProject_name() + "%";
		productLikes.setProject_name(keyword);
		return mybatis.selectList("mystatusmapper.searchProductLikes", productLikes);
	}
	public List<PurchaseProduct> searchPurchaseProduct(PurchaseProduct purchaseProduct) {
		String keyword = "%" + purchaseProduct.getProject_name() + "%";
		purchaseProduct.setProject_name(keyword);
		return mybatis.selectList("mystatusmapper.searchPurchaseProduct", purchaseProduct);
	}
}
