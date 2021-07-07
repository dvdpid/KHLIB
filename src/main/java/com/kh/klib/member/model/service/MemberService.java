package com.kh.klib.member.model.service;

import com.kh.klib.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(Member m);

	int insertMember(Member m);

	int dupId(String id);

}
