package com.kh.klib.main.model.service;

import java.util.ArrayList;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.room.model.vo.Room;

public interface MainPageService {

	ArrayList<Room> selectrList();

	int getAllListCount();

	int getlistCount();

	ArrayList<Culture> selectcList();

	ArrayList<BookGroup> selectbgList();

	ArrayList<Notice> selectNoticeList();

	ArrayList<Books> selectBookList();

}
