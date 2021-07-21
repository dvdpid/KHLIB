package com.kh.klib.board.model.service;

import java.util.ArrayList;

import com.kh.klib.board.model.vo.Board;
import com.kh.klib.board.model.vo.BoardSearchValue;
import com.kh.klib.comments.model.vo.Comments;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

	int insertFile(Files f);

	int insertNFile(Files f);

	Board selectBoard(int bNo);

	Files selectFile(int bNo);

	int updateBoard(Board b);

	int updateFile(Files f);

	int deleteBoard(int bNo);

	int deleteFiles(int bNo);

	int searchListCount(BoardSearchValue bsv);

	ArrayList<Board> selectSearchResultList(BoardSearchValue bsv, PageInfo pi);

	int insertComments(Comments c);

	ArrayList<Comments> selectCommentsList(int bNo);


}
