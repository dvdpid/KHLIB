package com.kh.klib.room.model.service;

import java.util.ArrayList;

import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

public interface RoomService {

	ArrayList<Room> selectrList();

	int updateRoom(Room r);

	int insertRoomSign(RoomSign rs);

	int getAllListCount();

	int getlistCount();

	int getChk(int uNo);

	ArrayList<RoomSign> selectrsList(int uNo);

	ArrayList<RoomSign> selectrsBeforeList(int uNo);

	int cancelRoom(Integer uNo);

	int updateStatus(Integer rNo);
}
