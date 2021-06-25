package com.kh.klib.books;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BooksController {
	
	@RequestMapping("book.bk")
	public String bookMain() {
		return "bookMain";
	}
	
	@RequestMapping("detail.bk")
	public String bookDetail() {
		// bookDetail에 넘겨줄 데이터를 가져올 서비스 선언
		return "bookDetail";
	}
	
	@RequestMapping("bookSearch.bk")
	public String bookSearch() {
		// bookDetail에 넘겨줄 데이터를 가져올 서비스 선언
		return "bookSearch";
	}
}
