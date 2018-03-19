package com.devone.finalp.pdetail.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Likes;
import com.devone.finalp.common.model.vo.Report;
import com.devone.finalp.pdetail.model.vo.GiftView;
import com.devone.finalp.pdetail.model.vo.HotListView;


@Repository("detailviewDao")
public class DetailViewDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<HotListView> selectHotList(){

		System.out.println("다오 들어옴");
		return mybatis.selectList("projectdetailMapper.selectHotList");
	}

	public List<GiftView> selectGiftList(String project_id) {
		
		return mybatis.selectList("projectdetailMapper.selectGiftList");
	}



	public int insertReport(Report report) {
		return  mybatis.insert("projectdetailMapper.insertReport", report);
		
	}

	public int selectLikes(String project_id) {
	
		return mybatis.selectOne("projectdetailMapper.selectLikes", project_id);
 
	}
	public Likes existLike(Likes likes) {
		return mybatis.selectOne("projectdetailMapper.existLike", likes);
	}

	public int addLikes(Likes likes) {
		return mybatis.insert("projectdetailMapper.addLikes", likes);
	}

	public int deleteLike(Likes likes) {
		return mybatis.delete("projectdetailMapper.deleteLike", likes);
	}
}
