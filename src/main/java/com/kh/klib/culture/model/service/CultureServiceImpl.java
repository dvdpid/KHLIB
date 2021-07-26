package com.kh.klib.culture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.dao.CultureDAO;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSearchCondition;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.vo.Member;

@Service("cService")
public class CultureServiceImpl implements CultureService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CultureDAO cDAO;

	@Override
	public int getListCount() {
		return cDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList selectTList(PageInfo pi, int i) {
		ArrayList list = null;
		
		if(i == 1) {
			list = cDAO.selectBList(sqlSession, pi);
		} else if(i == 2) {
			list = cDAO.selectFList(sqlSession, pi);
		}
		
		return list;
	}

	@Override
	public int getSearchResultListCount(CultureSearchCondition csc) {
		int listCount = cDAO.getSearchResultListCount(sqlSession, csc);
		return listCount;
	}

	@Override
	public ArrayList selectSearchResultTList(CultureSearchCondition csc, PageInfo pi, int i) {
		ArrayList list = null;
		
		if(i == 1) {
			list = cDAO.selectSearchResultBList(sqlSession, csc, pi);
		} else {
			list = cDAO.selectSearchResultFList(sqlSession, csc, pi);
		}
		return list;
	}

	@Override
	public Culture selectCulture(Integer cNo) {
		Culture c = null;
		
		c = cDAO.selectCulture(sqlSession, cNo);
		
		return c;
	}

	@Override
	public ArrayList<Files> selectFiles(Integer cNo) {
		ArrayList<Files> f = null;
	
		f = cDAO.selectFiles(sqlSession, cNo);
		
		return f;
	}

	@Override
	public int getApprovalCount(Integer cNo) {
		return cDAO.getApprovalCount(sqlSession, cNo);
	}

	@Override
	public int insertCultureSign(CultureSign cs) {
		return cDAO.insertCultureSign(sqlSession, cs);
	}

	@Override
	public ArrayList<CultureSign> selectcsList(Integer cNo) {
		return cDAO.selectcsList(sqlSession, cNo);
	}

	@Override
	public ArrayList<CultureSign> selectList(int uNo) {
		return cDAO.selectList(sqlSession, uNo);
	}

	@Override
	public ArrayList<Culture> selectcList() {
		return cDAO.selectcList(sqlSession);
	}

	@Override
	public int cancelCulture(CultureSign cs) {
		return cDAO.cancelCulture(sqlSession, cs);
	}

	@Override
	public int deleteCS(CultureSign cs) {
		return cDAO.deleteCS(sqlSession, cs);
	}

	@Override
	public Member selectMember(int uNo) {
		return cDAO.selectMember(sqlSession, uNo);
	}

	@Override
	public int updateCsMemberApply(CultureSign cs) {
		return cDAO.updateCsMemberApply(sqlSession, cs);
	}

	@Override
	public int updateCsMemberNoApply(CultureSign cs) {
		return cDAO.updateCsMemberNoApply(sqlSession, cs);
	}

	
}
