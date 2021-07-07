package com.kh.klib.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.admin.model.dao.AdminDAO;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.member.model.vo.Member;

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
		
		int result1 = aDAO.insertBook(sqlSession, b);
		
		return result1;
	}

	@Override
	public int insertAttachment(Files f) {
		return aDAO.insertAttachment(sqlSession, f);
	}

	@Override
	public int getcListCount() {
		return aDAO.getcListCount(sqlSession);
	}

	@Override
	public ArrayList<Culture> selectCList(PageInfo pi) {
		return aDAO.selectCList(sqlSession, pi);
	}

	@Override
	public int insertCulture(Culture c) {
		return aDAO.insertCulture(sqlSession, c);
	}

	@Override
	public int insertCultureAttachment(Files f) {
		return aDAO.insertCultureAttachment(sqlSession, f);
	}

	@Override
	public int insertCultureFile(Files f) {
		return aDAO.insertCultureFile(sqlSession, f);
	}

	@Override
	public Member adminLogin(Member m) {
		return aDAO.adminLogin(sqlSession, m);
	}
	
}
