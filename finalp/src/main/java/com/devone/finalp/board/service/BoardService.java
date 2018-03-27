package com.devone.finalp.board.service;

import java.util.List;

import com.devone.finalp.board.model.vo.Board;
import com.devone.finalp.board.model.vo.Board_Pagectr;
import com.devone.finalp.board.model.vo.Board_Reply;
import com.devone.finalp.board.model.vo.Board_recommend;
import com.devone.finalp.common.model.vo.Report;

public interface BoardService {
	List<Board> selectbList(Board_Pagectr bp);
	List<Board> selectView();
	List<Board> selectRec();
	List<Board_Reply> selectbrList();
	Board selectb(int board_id);
	Board_Reply selectbr(int board_reply_id);
	int insertBoard(Board b);
	int insertBoard_Reply(Board_Reply br);
	int deleteBoard(int board_id);
	int deleteBoard_Reply(int board_reply_id);
	int updateBoard(Board b);
	int updateBRC(Board b);
	int updateBoard_Reply(Board_Reply br);
	int countbReport(int board_id);
	int countbrReport(int board_reply_id);
	int getlistCount(String c_id);
	int checkRec(Board_recommend brec);
	int insertBoard_Rec(Board_recommend brec);
	int insertbReport(Report report);
	int checkRep(Report report);
	int insertbrReport(Report report);
	int checkbrRep(Report report);
	
}
