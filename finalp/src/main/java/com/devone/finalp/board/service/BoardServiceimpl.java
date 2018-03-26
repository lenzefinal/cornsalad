package com.devone.finalp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devone.finalp.board.dao.BoardDao;
import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.board.model.vo.Board_Reply;
import com.devone.finalp.board.model.vo.Board_recommend;
import com.devone.finalp.common.model.vo.Report;

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
	public int countbReport(int board_id) {
		return bDao.countbReport(board_id);
	}

	@Override
	public int countbrReport(int board_reply_id) {
		return bDao.countbrReport(board_reply_id);
	}

	@Override
	public int getlistCount(String c_id) {
		return bDao.getlistCount(c_id);
	}

	@Override
	public int updateBRC(Board b) {
		return bDao.updateBRC(b);
	}

	@Override
	public List<Board> selectView() {
		return bDao.selectView();
	}

	@Override
	public List<Board> selectRec() {
		return bDao.selectRec();
	}

	@Override
	public int checkRec(Board_recommend brec) {
		return bDao.checkRec(brec);
	}

	@Override
	public int insertBoard_Rec(Board_recommend brec) {
		return bDao.insertBoard_Rec(brec);
	}

	@Override
	public int insertbReport(Report report) {
		return bDao.insertReport(report);
	}

	@Override
	public int checkRep(Report report) {
		return bDao.checkRep(report);
	}

	@Override
	public int insertbrReport(Report report) {
		return bDao.insertbrReport(report);
	}

	@Override
	public int checkbrRep(Report report) {
		return bDao.checkbrRep(report);
	}
}
