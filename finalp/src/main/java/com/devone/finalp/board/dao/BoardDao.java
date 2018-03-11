package com.devone.finalp.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Reply;

@Repository("bDao")
public class BoardDao {
	@Autowired 
	private SqlSessionTemplate mDB;
	
	public List<Board> selectbList() {
		return mDB.selectList("boardMapper.selectbList");
		
	}
	public List<Board_Reply> selectbrList() {
		return mDB.selectList("boardMapper.selectbrList");
	}
	public Board selectb(int board_id) {
		return mDB.selectOne("boardMapper.selectb", board_id);
	}

	public Board_Reply selectbr(int board_reply_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertBoard(Board b) {
		return mDB.insert("boardMapper.insertBoard", b);
	}

	public int insertBoard_Reply(Board_Reply br) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBoard(int board_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBoard_Reply(int board_reply_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBoard_Reply(Board_Reply br) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int countbReport(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int countbrReport(Board_Reply br) {
		// TODO Auto-generated method stub
		return 0;
	}
}
