package com.kh.klib.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;

@Repository("aDAO")
public class AdminDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<Books> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}

	public int insertBook(SqlSessionTemplate sqlSession, Books b) {
		return sqlSession.insert("adminMapper.insertBook", b);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("adminMapper.insertAttachment", f);
	}

	
	public int getcListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getcListCount");
	}

	public ArrayList<Culture> selectCList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectCList", null, rowBounds);
	}

	public int insertCulture(SqlSessionTemplate sqlSession, Culture c) {
		return sqlSession.insert("adminMapper.insertCulture", c);
	}

	public int insertCultureAttachment(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("adminMapper.insertCultureAttachment", f);
	}

	public int insertCultureFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("adminMapper.insertCultureFile" ,f);
	}

	
}
