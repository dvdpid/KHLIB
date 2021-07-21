package com.kh.klib.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.board.model.vo.Board;
import com.kh.klib.board.model.vo.BoardSearchValue;
import com.kh.klib.comments.model.vo.Comments;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;

@Repository("boardDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}

	public int insertFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("boardMapper.insertFile", f);
	}

	public int insertNFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("boardMapper.insertNFile", f);
	}


	public Board selectBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}

	public Files selectFile(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.selectFile", bNo);
	}

	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public int updateFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.update("boardMapper.updateFile", f);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteBoard", bNo);
	}

	public int deleteFiles(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.deleteFiles", bNo);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.addReadCount", bNo);
	} 

	public int searchListCount(SqlSessionTemplate sqlSession, BoardSearchValue bsv) {
		return sqlSession.selectOne("boardMapper.searchListCount", bsv);
	}

	public ArrayList<Board> selectSearchResultList(SqlSessionTemplate sqlSession, BoardSearchValue bsv, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchResultList", bsv, rowBounds);
	}

	public int insertComments(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.insert("boardMapper.insertComments", c);
	}

	public ArrayList selectCommentsList(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectCommentsList", bNo);
	}

}
