package com.kh.klib.books.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.klib.books.model.exception.BooksException;
import com.kh.klib.books.model.service.BooksService;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.books.model.vo.SearchCondition;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.PageInfo;

@Controller
public class BooksController {
	
	@Autowired
	private BooksService bService;
	
	@RequestMapping("book.bk")
	public String bookMain(@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int listCount = bService.getBookCount();
		
		int limit = 8; // 클래스 변수로 바꿀 예정
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		PageInfo pi = Pagination.getBookPageInfo(currentPage, listCount, limit);
		ArrayList<Books> list = bService.getBookNewList(pi);
		
		if(list != null && !list.isEmpty()) {
			model.addAttribute("pi", pi);
			model.addAttribute("bList", list);			
		}
		
		return "bookMain";
	}
	
	@RequestMapping("recommend.bk")
	public String bookRecommend(@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int limit = 8; // 클래스 변수로 바꿀 예정
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getBookRecommendListCount();
		
		PageInfo pi = Pagination.getBookPageInfo(currentPage, listCount, limit);
		
		ArrayList<Books> list = bService.getBookRecommendList(pi);
		
		if(list != null && !list.isEmpty()) {
			model.addAttribute("bList", list);
			model.addAttribute("pi", pi);
		}
		
		return "bookRecommend";
		
	}
	
	@RequestMapping("detail.bk")
	public String bookDetail(@RequestParam("bNo") int bno, Model model) {
		Books book = bService.getBook(bno);
		
		System.out.println(book);
		
		if(book != null) {
			model.addAttribute("book", book);
			return "bookDetail";
		} else {
			throw new BooksException("게시글 상세조회에 실패하였습니다.");
		}
	}
	

	@RequestMapping("bookSearch.bk")
	public String bookSearch(@RequestParam(value="searchCondition", required=false) String condition, 
							 @RequestParam(value="searchValue", required=false) String value, 
							 @RequestParam(value="page", required=false) Integer page, 
							 Model model) {
		
		
		SearchCondition sc = new SearchCondition();
		
		if(condition != null) {
			if(condition.equals("writer")) sc.setWriter(value);
			else if(condition.equals("title")) sc.setTitle(value);
			else if(condition.equals("company")) sc.setCompany(value);
			else if(condition.equals("content")) sc.setContent(value); // 내용			
		}

		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		
		
		int limit = 9;
		int listCount = bService.getSearchResultListCount(sc);
		PageInfo pi  = Pagination.getBookPageInfo(currentPage, listCount, limit);
		
		ArrayList<Books> bList = bService.getSearchResultList(sc, pi);
		if(bList != null) {			
			model.addAttribute("bList", bList);
			model.addAttribute("pi", pi);
		}
		
		return "bookSearch";
		
	}
}
