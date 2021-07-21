package com.kh.klib.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.board.model.dao.BoardDAO;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.board.model.vo.BoardSearchValue;
import com.kh.klib.comments.model.vo.Comments;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;


@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public int getListCount() {
		return boardDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return boardDAO.insertBoard(sqlSession, b);
	}

	@Override
	public int insertFile(Files f) {
		return boardDAO.insertFile(sqlSession, f);
	}

	@Override
	public int insertNFile(Files f) {
		return boardDAO.insertNFile(sqlSession, f);
	}

	@Override
	public Board selectBoard(int bNo) {
		Board b = null;
		
		int result = boardDAO.addReadCount(sqlSession, bNo);
		
		if(result > 0) {
			b = boardDAO.selectBoard(sqlSession, bNo);
		}
		return b;
	}

	@Override
	public Files selectFile(int bNo) {
		return boardDAO.selectFile(sqlSession, bNo);
	}

	@Override
	public int updateBoard(Board b) {
		return boardDAO.updateBoard(sqlSession, b);
	}

	@Override
	public int updateFile(Files f) {
		return boardDAO.updateFile(sqlSession, f);
	}

	@Override
	public int deleteBoard(int bNo) {
		return boardDAO.deleteBoard(sqlSession, bNo);
	}

	@Override
	public int deleteFiles(int bNo) {
		return boardDAO.deleteFiles(sqlSession, bNo);
	}

	@Override
	public int searchListCount(BoardSearchValue bsv) {
		return boardDAO.searchListCount(sqlSession, bsv);
	} 

	@Override
	public ArrayList<Board> selectSearchResultList(BoardSearchValue bsv, PageInfo pi) {
		return boardDAO.selectSearchResultList(sqlSession, bsv, pi);
	}

	@Override
	public int insertComments(Comments c) {
		return boardDAO.insertComments(sqlSession, c);
	}

	@Override
	public ArrayList<Comments> selectCommentsList(int bNo) {
		return (ArrayList)boardDAO.selectCommentsList(sqlSession, bNo);
	}

}
