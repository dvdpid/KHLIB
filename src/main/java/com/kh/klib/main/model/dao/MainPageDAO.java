package com.kh.klib.main.model.dao;


import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.room.model.vo.Room;

@Repository("mpDAO")
public class MainPageDAO {

	public ArrayList<Room> selectrList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainpageMapper.selectrList");
	}
	
	public int getAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainpageMapper.getAllListCount");
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainpageMapper.getListCount");
	}

	public ArrayList<Culture> selectcList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainpageMapper.selectcList");
	}

	public ArrayList<BookGroup> selectbgList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainpageMapper.selectbgList");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainpageMapper.selectNoticeList");
	}

	public ArrayList<Books> selectBookList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mainpageMapper.selectBookList");
	}

}
