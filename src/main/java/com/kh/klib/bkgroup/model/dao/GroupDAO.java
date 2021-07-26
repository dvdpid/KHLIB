package com.kh.klib.bkgroup.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.BookGroupSearchValue;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.member.model.vo.Member;

@Repository("gDAO")
public class GroupDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("groupMapper.getListCount");
	}


	public ArrayList selectBList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		System.out.println(pi.getCurrentPage());
		System.out.println(offset);
		System.out.println("rowBounds : " + rowBounds);
		
		return (ArrayList)sqlSession.selectList("groupMapper.selectBList", null, rowBounds);
	}

	public ArrayList selectFList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupMapper.selectFList", null, rowBounds);
	}


	public int insertGroup(SqlSessionTemplate sqlSession, BookGroup g) {
		return sqlSession.insert("groupMapper.insertGroup", g);
	}


	public int insertFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("groupMapper.insertFile", f);
	}


	public BookGroup selectGroup(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.selectOne("groupMapper.selectGroup", gNo);
	}


	public Files selectFile(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.selectOne("groupMapper.selectFile", gNo);
	}


	public int deleteGroup(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.update("groupMapper.deleteGroup", gNo);
	}


	public int deleteFiles(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.update("groupMapper.deleteFiles", gNo);
	}


	public Member selectMember(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("groupMapper.selectMember", uNo);
	}


	public BookGroup selectBookGroup(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.selectOne("groupMapper.selectBookGroup", gNo);
	}


	public int updateGroup(SqlSessionTemplate sqlSession, BookGroup group) {
		return sqlSession.update("groupMapper.updateGroup", group);
	}


	public int updateFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.update("groupMapper.updateFile", f);
	}


	public int searchListCount(SqlSessionTemplate sqlSession, BookGroupSearchValue gsv) {
		return sqlSession.selectOne("groupMapper.searchListCount", gsv);
	}


	public ArrayList selectSearchGList(SqlSessionTemplate sqlSession, BookGroupSearchValue gsv, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupMapper.selectSearchGList", gsv, rowBounds);
	}


	public ArrayList selectSearchFList(SqlSessionTemplate sqlSession, BookGroupSearchValue gsv, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("groupMapper.selectSearchFList", gsv, rowBounds);
	
	}


	public int insertGroupSign(SqlSessionTemplate sqlSession, GroupSign gs) {
		return sqlSession.insert("groupMapper.inserGroupSign", gs);
	}


	public ArrayList<GroupSign> selectGroupSign(SqlSessionTemplate sqlSession, int uNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectGroupSign", uNo);
	}


	public int selectGroupSignListCount(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("groupMapper.selectGroupSignListCount", uNo);
	}


	public ArrayList<BookGroup> selectBookGroupList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectBookGroupList");
	}

	public int getSignMemberCount(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.selectOne("groupMapper.getSignMemberCount", gNo);
	}


	public ArrayList<BookGroup> selectMyBookGroupList(SqlSessionTemplate sqlSession, String nickname) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectMyBookGroupList", nickname);
	}


	public GroupSign selectMyGroupSign(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.selectOne("groupMapper.selectMyGroupSign", gNo);
	}


	public ArrayList<GroupSign> selectgroupSignGno(SqlSessionTemplate sqlSession, int gNo) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectgroupSignGno", gNo);
	}


	public int deleteGsCancle(SqlSessionTemplate sqlSession, GroupSign gs) {
		return sqlSession.delete("groupMapper.deleteGsCancle", gs);
	}


	public ArrayList<Member> selectSignMemberList(SqlSessionTemplate sqlSession, int signUno) {
		return (ArrayList)sqlSession.selectList("groupMapper.selectSignMemberList", signUno);
	}


	public int updateGsMemberApply(SqlSessionTemplate sqlSession, GroupSign gs) {
		return sqlSession.update("groupMapper.updateGsMemberApply", gs);
	}


	public int updateGsMemberNoApply(SqlSessionTemplate sqlSession, GroupSign gs) {
		return sqlSession.update("groupMapper.updateGsMemberNoApply", gs);
	}


	public int updateDeadLine(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.update("groupMapper.updateDeadLine", gNo);
	}


	public int updateNoDeadLine(SqlSessionTemplate sqlSession, int gNo) {
		return sqlSession.update("groupMapper.updateNoDeadLine", gNo);
	}







	
	

}
