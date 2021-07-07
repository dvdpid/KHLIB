package com.kh.klib.books.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.klib.books.model.vo.Books;
import com.kh.klib.books.model.vo.SearchCondition;
import com.kh.klib.common.model.vo.PageInfo;

@Repository("bDAO")
public class BooksDAO {

	public ArrayList<Books> getBookList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.getBookList", null, rowBounds);
	}

	public int getBookCount(SqlSession sqlSession) {
		return sqlSession.selectOne("bookMapper.getBookListCount");
	}

	public void updateCount(SqlSession sqlSession, int bno) {
		sqlSession.update("bookMapper.updateCount", bno);
		
	}

	public Books getBook(SqlSession sqlSession, int bno) {
		return sqlSession.selectOne("bookMapper.selectBook", bno);
	}

	public int getSearchResultListCount(SqlSession sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("bookMapper.getSearchResultListCount", sc);
	}

	public ArrayList<Books> getsearchResultList(SqlSession sqlSession, SearchCondition sc, PageInfo pi) {
		int offset =  (pi.getCurrentPage() - 1 ) * pi.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectSearchResultList", sc, rb);
	}

	public ArrayList<Books> getBookRecommendList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("bookMapper.selectRecommendResultList", null, rowBounds);
	}

	public int getBookRecommendListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("bookMapper.selectBookRecommendCount");
	}

}
