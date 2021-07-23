package com.kh.klib.member.model.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.kh.klib.member.model.vo.Member;

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
	

	

}
