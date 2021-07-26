package com.kh.klib.member.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.room.model.vo.RoomSign;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int dupId(String id);

	int deleteMember(String id);

	Member mlistcheck(String id);

	int nickname(String nickname);

	int updateMember(Member m);
	
	void sendEmail(Member member, String div) throws Exception;

	void findPwd(HttpServletResponse response, Member member) throws Exception;

	int updatePwd(Member member);

	ArrayList<RoomSign> selectrList(int no);

	ArrayList<Board> selectbList(String name);

	ArrayList<GroupSign> selectgsList(int no);

	ArrayList<BookGroup> selectgList();

	ArrayList<CultureSign> selectcsList(int no);

	ArrayList<Culture> selectcList();

	String findId(Member m);

	

	

}
