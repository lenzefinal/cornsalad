package com.devone.finalp.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.board.model.vo.Board_Reply;
import com.devone.finalp.board.model.vo.Board_recommend;

@Repository("bDao")
public class BoardDao {
	@Autowired 
	private SqlSessionTemplate mDB;
	
	public List<Board> selectbList(Board_Pagectr bp) {
		return mDB.selectList("boardMapper.selectbList",bp);
		
	}
	public List<Board_Reply> selectbrList( ) {
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
		return mDB.insert("boardMapper.insertBoardR", br);
	}

	public int deleteBoard(int board_id) {
		return mDB.delete("boardMapper.deleteBoard", board_id);
	}
	public int deleteBoard_Reply(int board_reply_id) {
		return mDB.delete("boardMapper.deleteBoardR",board_reply_id);
	}

	public int updateBoard(Board b) {
		return mDB.update("boardMapper.updateBoard", b);
	}
	public int updateBRC(Board b) {
		return mDB.update("boardMapper.updateBRC", b);
	}

	public int updateBoard_Reply(Board_Reply br) {
		System.out.println(br);
		return mDB.update("boardMapper.updateBoardR", br);
	}

	public int countbReport(int board_id) {
		return mDB.update("boardMapper.upBReport",board_id);
	}

	public int countbrReport(int board_reply_id) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int getlistCount(String c_id) {
		return mDB.selectOne("boardMapper.blistCount",c_id);
		 
	}
	public List<Board> selectView() {
		return mDB.selectList("boardMapper.selectView");
	}
	public List<Board> selectRec() {
		return mDB.selectList("boardMapper.selectRec");
	}
	public int checkRec(Board_recommend brec) {
		return mDB.selectOne("boardMapper.checkRec",brec);
	}
	public int insertBoard_Rec(Board_recommend brec) {
		 return mDB.insert("boardMapper.insertBoard_Rec", brec);
	}
}
