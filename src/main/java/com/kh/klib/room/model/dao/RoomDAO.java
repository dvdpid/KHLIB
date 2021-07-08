package com.kh.klib.room.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

@Repository("rDAO")
public class RoomDAO {

	public ArrayList<Room> selectrList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectrList");
	}

	public int updateRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.update("roomMapper.updateRoom", r);
	}

	public int insertRoomSign(SqlSessionTemplate sqlSession, RoomSign rs) {
		return sqlSession.insert("roomMapper.insertRoomSign", rs);
	}

	public int getAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.getAllListCount");
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("roomMapper.getListCount");
	}

	public int getChk(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("roomMapper.getChk", uNo);
	}

	public ArrayList<RoomSign> selectrsList(SqlSessionTemplate sqlSession, int uNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectrsList", uNo);
	}

	public ArrayList<RoomSign> selectrsBeforeList(SqlSessionTemplate sqlSession, int uNo) {
		return (ArrayList)sqlSession.selectList("roomMapper.selectrsBeforeList", uNo);
	}

	public int cancelRoom(SqlSessionTemplate sqlSession, Integer uNo) {
		return sqlSession.update("roomMapper.cancelRoom", uNo);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, Integer rNo) {
		return sqlSession.update("roomMapper.updateStatus", rNo);
	}

}
