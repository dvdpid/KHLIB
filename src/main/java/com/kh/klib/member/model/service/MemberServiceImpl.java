package com.kh.klib.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.member.model.dao.MemberDAO;
import com.kh.klib.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int dupId(String id) {
		return mDAO.dupId(sqlSession, id);
	}

	@Override
	public int deleteMember(String id) {
		return mDAO.delteMember(sqlSession, id);
	}

	@Override
	public Member mlistcheck(String id) {		
		return mDAO.mlistcheck(sqlSession, id);
	}

	@Override
	public int nickname(String nickname) {
		return mDAO.nickname(sqlSession, nickname);
	}

	@Override
	public int updateMember(Member m) {		
		return mDAO.updateMember(sqlSession, m);		
	}

	
}