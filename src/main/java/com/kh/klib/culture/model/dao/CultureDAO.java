package com.kh.klib.culture.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSearchCondition;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.vo.Member;

@Repository("cDAO")
public class CultureDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("cultureMapper.getListCount");
	}

	public ArrayList selectBList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cultureMapper.selectBList", null, rowBounds);
	}

	public ArrayList selectFList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cultureMapper.selectFList", null, rowBounds);
	}

	public int getSearchResultListCount(SqlSessionTemplate sqlSession, CultureSearchCondition csc) {
		return sqlSession.selectOne("cultureMapper.getSearchResultListCount", csc);
	}

	public ArrayList selectSearchResultBList(SqlSessionTemplate sqlSession, CultureSearchCondition csc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cultureMapper.selectSearchResultBList", csc, rowBounds);
	}

	public ArrayList selectSearchResultFList(SqlSessionTemplate sqlSession, CultureSearchCondition csc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("cultureMapper.selectSearchResultFList", csc, rowBounds);
	}

	public Culture selectCulture(SqlSessionTemplate sqlSession, Integer cNo) {
		return sqlSession.selectOne("cultureMapper.selectCulture", cNo);
	}

	public ArrayList<Files> selectFiles(SqlSessionTemplate sqlSession, Integer cNo) {
		return (ArrayList)sqlSession.selectList("cultureMapper.selectFiles", cNo);
	}

	public int getApprovalCount(SqlSessionTemplate sqlSession, Integer cNo) {
		return sqlSession.selectOne("cultureMapper.getApprovalCount", cNo);
	}

	public int insertCultureSign(SqlSessionTemplate sqlSession, CultureSign cs) {
		return sqlSession.insert("cultureMapper.insertCultureSign", cs);
	}

	public ArrayList<CultureSign> selectcsList(SqlSessionTemplate sqlSession, Integer cNo) {
		return (ArrayList)sqlSession.selectList("cultureMapper.selectcsList", cNo);
	}

	public ArrayList<CultureSign> selectList(SqlSessionTemplate sqlSession, int uNo) {
		return (ArrayList)sqlSession.selectList("cultureMapper.selectList", uNo);
	}

	public ArrayList<Culture> selectcList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("cultureMapper.selectcList");
	}

	public int cancelCulture(SqlSessionTemplate sqlSession, CultureSign cs) {
		return sqlSession.update("cultureMapper.cancelCulture", cs);
	}

	public int deleteCS(SqlSessionTemplate sqlSession, CultureSign cs) {
		return sqlSession.delete("cultureMapper.deleteCS", cs);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("cultureMapper.selectMember", uNo);
	}

	public int updateCsMemberApply(SqlSessionTemplate sqlSession, CultureSign cs) {
		return sqlSession.update("cultureMapper.updateCsMemberApply", cs);
	}

	public int updateCsMemberNoApply(SqlSessionTemplate sqlSession, CultureSign cs) {
		return sqlSession.update("cultureMapper.updateCsMemberNoApply", cs);
	}


}
