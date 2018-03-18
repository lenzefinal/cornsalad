package com.devone.finalp.board.service;

import java.util.List;

import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.board.model.vo.Board_Reply;

public interface BoardService {
	List<Board> selectbList(Board_Pagectr bp);
	List<Board_Reply> selectbrList();
	Board selectb(int board_id);
	Board_Reply selectbr(int board_reply_id);
	int insertBoard(Board b);
	int insertBoard_Reply(Board_Reply br);
	int deleteBoard(int board_id);
	int deleteBoard_Reply(int board_reply_id);
	int updateBoard(Board b);
	int updateBoard_Reply(Board_Reply br);
	int countbReport(Board b);
	int countbrReport(Board_Reply br);
	int getlistCount(String c_id);
}
