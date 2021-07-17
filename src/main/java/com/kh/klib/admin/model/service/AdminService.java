package com.kh.klib.admin.model.service;

import java.util.ArrayList;

import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

public interface AdminService {

	int getListCount();

	ArrayList<Books> selectList(PageInfo pi);

	int insertBook(Books b);

	int insertAttachment(Files f);

	
	int getcListCount();
	
	ArrayList<Culture> selectCList(PageInfo pi);

	int insertCulture(Culture c);

	int insertCultureAttachment(Files f);

	int insertCultureFile(Files f);

	Member adminLogin(Member m);

	int insertAdmin(Member m);

	int dupId(String id);

	int getListUserCount();

	ArrayList<Member> selectUserList(PageInfo pi);

	int getListadminUserCount();

	ArrayList<Member> selectadminUserList(PageInfo api);

	int deleteUser(Integer no);

	int deleteAdmin(Integer no);

	ArrayList<Room> selectrList();

	int getAllListCount();

	int getrlistCount();

	int getChk(int uNo);

	ArrayList<RoomSign> selectNick(Integer rNo);

	int cancelRoom(Integer rNo);

	int outTime(Integer rsNo);

	ArrayList<Books> selectBlist(Integer bNo);

	int deleteBook(Integer bNo);

	ArrayList<Files> selectBFileName(Integer bNo);

	int updateBook(Books b);

	int updateBAttachment(Files f);




}
