package com.devone.finalp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.board.dao.BoardDao;
import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.board.model.vo.Board_Reply;

@Service("bService")
public class BoardServiceimpl implements BoardService{
	@Autowired
	private BoardDao bDao;

	@Override
	public List<Board> selectbList(Board_Pagectr bp) {
		return bDao.selectbList(bp);
	}

	@Override
	public List<Board_Reply> selectbrList() {
		return bDao.selectbrList();
	}

	@Override
	public Board selectb(int board_id) {
		return bDao.selectb(board_id);
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
		return bDao.insertBoard_Reply(br);
	}

	@Override
	public int deleteBoard(int board_id) {
		
		return bDao.deleteBoard(board_id);
	}

	@Override
	public int deleteBoard_Reply(int board_reply_id) {
		return bDao.deleteBoard_Reply(board_reply_id);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(b);
	}

	@Override
	public int updateBoard_Reply(Board_Reply br) {
		return bDao.updateBoard_Reply(br);
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

	@Override
	public int getlistCount(String c_id) {
		return bDao.getlistCount(c_id);
	}
}
