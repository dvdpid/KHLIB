package com.kh.klib.admin.model.service;

import java.util.ArrayList;

import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.member.model.vo.Member;

public interface AdminService {

	int getListCount();

	ArrayList<Books> selectList(PageInfo pi);

	int insertBook(Books b);

	int insertAttachment(Files f);

	
	int getcListCount();
	
	ArrayList<Culture> selectCList(PageInfo pi);

	int insertCulture(Culture c);

	int insertCultureAttachment(Files f);

	int insertCultureFile(Files f);

	Member adminLogin(Member m);


}
