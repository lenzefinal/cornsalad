package com.devone.finalp.webchat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.common.model.vo.Webchat;

@Repository("wDao")
public class webchatDao {
	@Autowired 
	private SqlSessionTemplate mDB;
	
	public int insertWC(Webchat wc) {
		return mDB.insert("webchatMapper.insertWC", wc);
	}

	public List<Webchat> selectWCList() {
		return mDB.selectList("webchatMapper.selectWC");
	}

	public int deleteWC(String room_id) {
		System.out.println("Dao");
		int i = mDB.delete("webchatMapper.deleteWC", room_id);
		while(i<=0) {
			i = mDB.delete("webchatMapper.deleteWC", room_id);
		}
		return i;
	}

	public Webchat searchWC(String room_id) {
		return mDB.selectOne("webchatMapper.searchWC", room_id);
	}

}
