package com.kh.klib.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.notice.exception.NoticeException;
import com.kh.klib.notice.model.dao.NoticeDAO;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.notice.model.vo.NoticeSearchValue;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDAO nDAO;
	
	
	@Override
	public int getNoticeListCount() {
		return nDAO.getNoticeListCount(sqlSession);
	}


	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDAO.selectNoticeList(sqlSession, pi);
	}


	@Override
	public ArrayList<Notice> selectNDList(Integer nNo) {
		
		int result = nDAO.addReadCount(sqlSession, nNo);
		if(result > 0) {
			return nDAO.selectNDList(sqlSession, nNo);
		} else {
			throw new NoticeException("조회 실패");
		}
	}


	@Override
	public int searchListCount(NoticeSearchValue nsv) {
		return nDAO.searchListCount(sqlSession, nsv);
	}


	@Override
	public ArrayList<Notice> selectSearchResultList(NoticeSearchValue nsv, PageInfo pi) {
		return nDAO.selectSearchResultList(sqlSession, nsv, pi );
	}
	
	
	
}
