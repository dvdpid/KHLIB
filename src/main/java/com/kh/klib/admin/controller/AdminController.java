package com.kh.klib.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("user.ad")
	public String adminUserForm() {
		return "admin_user";
	}
	@RequestMapping("board.ad")
	public String adminBoardForm() {
		return "admin_board";
	}
	@RequestMapping("room.ad")
	public String adminRoomForm() {
		return "admin_room";
	}
	@RequestMapping("book.ad")
	public String adminBookForm() {
		return "admin_book";
	}
	@RequestMapping("culture.ad")
	public String adminCultureForm() {
		return "admin_culture";
	}
	@RequestMapping("bkgroup.ad")
	public String adminBgroupForm() {
		return "admin_bGroup";
	}
}
