package com.devone.finalp.pdetail.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Likes;

@Repository("detailviewDao")
public class DetailViewDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<Likes> selectHotList(){
		return mybatis.selectList("projectdetail.selectHotList");
	}
 

}
