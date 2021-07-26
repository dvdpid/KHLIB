package com.kh.klib.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.notice.model.vo.NoticeSearchValue;

@Repository("nDAO")
public class NoticeDAO {

	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public ArrayList<Notice> selectNDList(SqlSessionTemplate sqlSession, Integer nNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNDList", nNo);
	}

	public int addReadCount(SqlSessionTemplate sqlSession, Integer nNo) {
		return sqlSession.update("noticeMapper.addReadCount", nNo);
	}

	public int searchListCount(SqlSessionTemplate sqlSession, NoticeSearchValue nsv) {
		return sqlSession.selectOne("noticeMapper.searchListCount", nsv);
	}

	public ArrayList<Notice> selectSearchResultList(SqlSessionTemplate sqlSession, NoticeSearchValue nsv, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchResultList", nsv, rowBounds);
	}

	
}
