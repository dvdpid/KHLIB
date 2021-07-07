package com.kh.klib.books.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.books.model.dao.BooksDAO;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.books.model.vo.SearchCondition;
import com.kh.klib.common.model.vo.PageInfo;

@Service("bService")
public class BooksServiceImpl implements BooksService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BooksDAO bDAO;

	@Override
	public Books getBook(int bno) {
		return bDAO.getBook(sqlSession, bno);
	}

	@Override
	public ArrayList<Books> getBookList(PageInfo pi) {
		return bDAO.getBookList(sqlSession, pi);
	}

	@Override
	public int getBookCount() {
		return bDAO.getBookCount(sqlSession);
	}

	@Override
	public ArrayList<Books> getBookNewList(PageInfo pi) {
		return bDAO.getBookList(sqlSession, pi);
	}

	@Override
	public ArrayList<Books> getBookRecommendList(PageInfo pi) {
		return bDAO.getBookRecommendList(sqlSession, pi);
	}

	@Override
	public int getSearchResultListCount(SearchCondition sc) {
		return bDAO.getSearchResultListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Books> getSearchResultList(SearchCondition sc, PageInfo pi) {
		
		return bDAO.getsearchResultList(sqlSession, sc, pi);
	}

	@Override
	public int getBookRecommendListCount() {
		return bDAO.getBookRecommendListCount(sqlSession);
	}

}
