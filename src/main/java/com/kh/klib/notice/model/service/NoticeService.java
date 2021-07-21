package com.kh.klib.notice.model.service;

import java.util.ArrayList;

import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.notice.model.vo.NoticeSearchValue;

public interface NoticeService {

	int getNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	ArrayList<Notice> selectNDList(Integer nNo);

	int searchListCount(NoticeSearchValue nsv);

	ArrayList<Notice> selectSearchResultList(NoticeSearchValue nsv, PageInfo pi);


	
}
