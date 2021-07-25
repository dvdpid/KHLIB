package com.kh.klib.bkgroup.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.BookGroupSearchValue;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.member.model.vo.Member;

public interface GroupService {

	int getListCount();

	ArrayList selectTList(PageInfo pi, int i);

	int insertGroup(BookGroup g);

	int insertFile(Files f);

	BookGroup selectGroup(int gNo);

	Files selectFile(int gNo);

	int deleteGroup(int gNo);

	int deleteFiles(int gNo);

	Member selectMember(int uNo);

	BookGroup selectBookGroup(int gNo);

	int updateGroup(BookGroup group);

	int updateFile(Files f);

	int searchListCount(BookGroupSearchValue gsv);

	ArrayList selectSearchResultTList(BookGroupSearchValue gsv, PageInfo pi, int i);

	int insertGroupSign(GroupSign gs);

	ArrayList<GroupSign> selectGroupSign(int uNo);

	int selectGroupSignListCount(int uNo);

	ArrayList<BookGroup> selectBookGroupList();

	int getSignMemberCount(int gNo);

	ArrayList<BookGroup> selectMyBookGroupList(String nickname);

	GroupSign selectMyGroupSign(int gNo);

	 ArrayList<GroupSign> selectgroupSignGno(int gNo);

	int deleteGsCancle(GroupSign gs);

	ArrayList<Member> selectSignMemberList(int signUno);

	int updateGsMemberApply(GroupSign gs);

	int updateGsMemberNoApply(GroupSign gs);

	int updateDeadLine(int gNo);

	int updateNoDeadLine(int gNo);












}
