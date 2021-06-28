package com.kh.klib.admin.model.service;

import java.util.ArrayList;

import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;

public interface AdminService {

	int getListCount();

	ArrayList<Books> selectList(PageInfo pi);

	int insertBook(Books b);

}
