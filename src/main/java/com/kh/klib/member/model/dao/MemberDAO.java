package com.kh.klib.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.room.model.vo.RoomSign;

@Repository("mDAO")
public class MemberDAO {

	public Member memberLogin(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.login", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int dupId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.dupId", id);
	}

	public int delteMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteMember", id);
	}

	public Member mlistcheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.mlistcheck",id);
	}

	public int nickname(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.dupNickname", nickname);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updatePwd", member);
	}

	public ArrayList<RoomSign> selectrList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectrList", no);
	}

	public ArrayList<Board> selectbList(SqlSessionTemplate sqlSession, String name) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectbList", name);
	}

	public int selectGno(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("memberMapper.selectGno", no);
	}

	public ArrayList<BookGroup> selectgList(SqlSessionTemplate sqlSession, int gNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectgList", gNo);
	}

	public int selectCno(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("memberMapper.selectCno", no);
	}

	public ArrayList<GroupSign> selectgsList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectgsList", no);
	}

	public ArrayList<BookGroup> selectgList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectgList");
	}

	public ArrayList<CultureSign> selectcsList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectcsList", no);
	}

	public ArrayList<Culture> selectcList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectcList");
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}



}
