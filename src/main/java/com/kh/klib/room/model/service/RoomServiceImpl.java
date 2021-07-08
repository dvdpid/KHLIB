package com.kh.klib.room.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.room.model.dao.RoomDAO;
import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

@Service("rService")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private RoomDAO rDAO;

	@Override
	public ArrayList<Room> selectrList() {
		return rDAO.selectrList(sqlSession);
	}

	@Override
	public int updateRoom(Room r) {
		return rDAO.updateRoom(sqlSession, r);
	}

	@Override
	public int insertRoomSign(RoomSign rs) {
		return rDAO.insertRoomSign(sqlSession, rs);
	}

	@Override
	public int getAllListCount() {
		return rDAO.getAllListCount(sqlSession);
	}

	@Override
	public int getlistCount() {
		return rDAO.getListCount(sqlSession);
	}

	@Override
	public int getChk(int uNo) {
		return rDAO.getChk(sqlSession, uNo);
	}

	@Override
	public ArrayList<RoomSign> selectrsList(int uNo) {
		return rDAO.selectrsList(sqlSession, uNo);
	}

	@Override
	public ArrayList<RoomSign> selectrsBeforeList(int uNo) {
		return rDAO.selectrsBeforeList(sqlSession, uNo);
	}

	@Override
	public int cancelRoom(Integer uNo) {
		return rDAO.cancelRoom(sqlSession, uNo);
	}

	@Override
	public int updateStatus(Integer rNo) {
		return rDAO.updateStatus(sqlSession, rNo);
	}

}
