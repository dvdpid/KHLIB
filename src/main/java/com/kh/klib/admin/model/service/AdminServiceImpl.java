package com.kh.klib.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.admin.model.dao.AdminDAO;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDAO aDAO;
	
	@Override
	public int getListCount() {
		return aDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Books> selectList(PageInfo pi) {
		return aDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBook(Books b) {
		return aDAO.insertBook(sqlSession, b);
	}
	
}
