package com.kh.klib.books;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BooksController {
	
	@RequestMapping("book.bk")
	public String bookMain() {
		return "bookMain";
	}
}
