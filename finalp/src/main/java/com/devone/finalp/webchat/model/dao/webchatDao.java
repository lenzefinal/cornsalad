package com.devone.finalp.webchat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.common.model.vo.Webchat;

@Repository("wDao")
public class webchatDao {
	@Autowired 
	private SqlSessionTemplate mDB;
	
	public int insertWC(Webchat wc) {
		return mDB.insert("webchatMapper.insertWC", wc);
	}

	public List<Webchat> selectWCList(Board_Pagectr bp) {
		System.out.println(bp.getC_id());
		System.out.println(bp.getStartnum());
		return mDB.selectList("webchatMapper.selectWC",bp);
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

	public int getlistCount(String c_id) {
		return mDB.selectOne("webchatMapper.wclistCount",c_id);
	}

	public List<Webchat> selecthomeList() {
		return mDB.selectList("webchatMapper.selecthomeList");
	}

}
