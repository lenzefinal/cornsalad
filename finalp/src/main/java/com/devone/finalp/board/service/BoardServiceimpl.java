package com.devone.finalp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.board.dao.BoardDao;
import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Reply;

@Service("bService")
public class BoardServiceimpl implements BoardService{
	@Autowired
	private BoardDao bDao;

	@Override
	public List<Board> selectbList() {
		return bDao.selectbList();
	}

	@Override
	public List<Board_Reply> selectbrList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectb(int board_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board_Reply selectbr(int board_reply_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(b);
	}

	@Override
	public int insertBoard_Reply(Board_Reply br) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int board_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard_Reply(int board_reply_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard_Reply(Board_Reply br) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countbReport(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countbrReport(Board_Reply br) {
		// TODO Auto-generated method stub
		return 0;
	}
}
