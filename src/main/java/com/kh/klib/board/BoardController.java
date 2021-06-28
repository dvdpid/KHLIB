package com.kh.klib.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	// 0624test
	
	@RequestMapping("board.bo")
	public String boardListForm() {
		System.out.println("컨트롤러로 옴");
		return "boardList";
	}
	
}
