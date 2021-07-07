package com.kh.klib.books.model.service;

import java.util.ArrayList;

import com.kh.klib.books.model.vo.Books;
import com.kh.klib.books.model.vo.SearchCondition;
import com.kh.klib.common.model.vo.PageInfo;

public interface BooksService {

	ArrayList<Books> getBookList(PageInfo pi);
	
	Books getBook(int bno);

	int getBookCount();
	
	ArrayList<Books> getBookNewList(PageInfo pi);

	ArrayList<Books> getBookRecommendList(PageInfo pi);

	int getSearchResultListCount(SearchCondition sc);

	ArrayList<Books> getSearchResultList(SearchCondition sc, PageInfo pi);

	int getBookRecommendListCount();

}
