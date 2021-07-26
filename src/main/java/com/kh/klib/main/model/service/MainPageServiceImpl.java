package com.kh.klib.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.main.model.dao.MainPageDAO;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.room.model.vo.Room;

@Service("mpService")
public class MainPageServiceImpl implements MainPageService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MainPageDAO mpDAO;

	@Override
	public ArrayList<Room> selectrList() {
		return mpDAO.selectrList(sqlSession);
	}

	@Override
	public int getAllListCount() {
		return mpDAO.getAllListCount(sqlSession);
	}

	@Override
	public int getlistCount() {
		return mpDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Culture> selectcList() {
		return mpDAO.selectcList(sqlSession);
	}

	@Override
	public ArrayList<BookGroup> selectbgList() {
		return mpDAO.selectbgList(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList() {
		return mpDAO.selectNoticeList(sqlSession);
	}

	@Override
	public ArrayList<Books> selectBookList() {
		return mpDAO.selectBookList(sqlSession);
	}

}
