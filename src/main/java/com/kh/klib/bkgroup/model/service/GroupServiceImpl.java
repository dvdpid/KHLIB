package com.kh.klib.bkgroup.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.bkgroup.model.dao.GroupDAO;
import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.BookGroupSearchValue;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.member.model.vo.Member;

@Service("gService")
public class GroupServiceImpl implements GroupService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GroupDAO gDAO;
	
	@Override
	public int getListCount() {
		return gDAO.getListCount(sqlSession);
	}


	@Override
	public ArrayList selectTList(PageInfo pi, int i) {
		
		ArrayList list = null;
		
		if(i == 1) {
			list = gDAO.selectBList(sqlSession, pi);
		} else {
			list = gDAO.selectFList(sqlSession, pi);
		}
		return list;
	}


	@Override
	public int insertGroup(BookGroup g) {
		return gDAO.insertGroup(sqlSession, g);
	}


	@Override
	public int insertFile(Files f) {
		return gDAO.insertFile(sqlSession, f);
	}


	@Override
	public BookGroup selectGroup(int gNo) {
		return gDAO.selectGroup(sqlSession, gNo);
	}


	@Override
	public Files selectFile(int gNo) {
		return gDAO.selectFile(sqlSession, gNo);
	}


	@Override
	public int deleteGroup(int gNo) {
		return gDAO.deleteGroup(sqlSession, gNo);
	}


	@Override
	public int deleteFiles(int gNo) {
		return gDAO.deleteFiles(sqlSession, gNo);
	}



	@Override
	public Member selectMember(int uNo) {
		return gDAO.selectMember(sqlSession, uNo);
	}


	@Override
	public BookGroup selectBookGroup(int gNo) {
		return gDAO.selectBookGroup(sqlSession, gNo);
	}


	@Override
	public int updateGroup(BookGroup group) {
		return gDAO.updateGroup(sqlSession, group);
	}


	@Override
	public int updateFile(Files f) {
		return gDAO.updateFile(sqlSession, f);
	}


	@Override
	public int searchListCount(BookGroupSearchValue gsv) {
		return gDAO.searchListCount(sqlSession, gsv);
	}


	@Override
	public ArrayList selectSearchResultTList(BookGroupSearchValue gsv, PageInfo pi, int i) {
		
		ArrayList list = null;
		
		if(i == 1) {
			list = gDAO.selectSearchGList(sqlSession, gsv, pi);
		} else if(i == 2) {
			list = gDAO.selectSearchFList(sqlSession, gsv, pi);
		}
		
		return list;
	}


	@Override
	public int insertGroupSign(GroupSign gs) {
		return gDAO.insertGroupSign(sqlSession, gs);
	}


	@Override
	public ArrayList<GroupSign> selectGroupSign(int uNo) {
		return gDAO.selectGroupSign(sqlSession, uNo);
	}


	@Override
	public int selectGroupSignListCount(int uNo) {
		return gDAO.selectGroupSignListCount(sqlSession, uNo);
	}


	@Override
	public ArrayList<BookGroup> selectBookGroupList() {
		return gDAO.selectBookGroupList(sqlSession);
	}


	@Override
	public int getSignMemberCount(int gNo) {
		return gDAO.getSignMemberCount(sqlSession, gNo);
	}


	@Override
	public ArrayList<BookGroup> selectMyBookGroupList(String nickname) {
		return gDAO.selectMyBookGroupList(sqlSession, nickname);
	}


	@Override
	public GroupSign selectMyGroupSign(int gNo) {
		return gDAO.selectMyGroupSign(sqlSession, gNo);
	}


	@Override
	public  ArrayList<GroupSign> selectgroupSignGno(int gNo) {
		return gDAO.selectgroupSignGno(sqlSession, gNo);
	}


	@Override
	public int deleteGsCancle(GroupSign gs) {
		return gDAO.deleteGsCancle(sqlSession, gs);
	}


	@Override
	public ArrayList<Member> selectSignMemberList(int signUno) {
		return gDAO.selectSignMemberList(sqlSession, signUno);
	}


	@Override
	public int updateGsMemberApply(GroupSign gs) {
		return gDAO.updateGsMemberApply(sqlSession, gs);
	}


	@Override
	public int updateGsMemberNoApply(GroupSign gs) {
		return gDAO.updateGsMemberNoApply(sqlSession, gs);
	}


	@Override
	public int updateDeadLine(int gNo) {
		return gDAO.updateDeadLine(sqlSession, gNo);
	}


	@Override
	public int updateNoDeadLine(int gNo) {
		return gDAO.updateNoDeadLine(sqlSession, gNo);
	}
















}
