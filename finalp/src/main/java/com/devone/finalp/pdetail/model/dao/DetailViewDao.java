package com.devone.finalp.pdetail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("detailviewDao")
public class DetailViewDao {
	
	@Autowired
	private SqlSessionTemplate mybatis;
 

}
