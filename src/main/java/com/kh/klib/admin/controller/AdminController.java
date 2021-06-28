package com.kh.klib.admin.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.admin.model.service.AdminService;
import com.kh.klib.books.model.exception.BooksException;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	
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
	public ModelAndView adminBookList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = aService.getListCount();
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Books> list = aService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_book");
		} else {
			throw new BooksException("도서 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("bookInsertForm.ad")
	public String bookInsertForm() {
		return "admin_add_book";
	}
//	@RequestMapping("bkinsert.ad")
//	public String insertBook(@ModelAttribute Books b, @RequestParam("thumbnailImg1") MultipartFile thumbnailImg1, HttpServletRequest request) {
//		Files f = new Files();
//		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
//			String renameFileName = saveFile(thumbnailImg1, request);
//			
//			if(renameFileName != null) {
//				f.setOriginName(thumbnailImg1.getOriginalFilename());
//				f.setChangeName(renameFileName);
//			}
//		}
//		int result = aService.insertBook(b);
//		
//		if(result > 0) {
//			return "redirect:book.ad";
//		} else {
//			throw new BooksException("도서 등록에 실패");
//		}
//		
//	}
//	public String saveFile(MultipartFile thumbnailImg1, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "/bkuploadFiles";
//		
//		File folder = new File(savePath);
//		if(!folder.exists()) {
//			folder.mkdir();
//		}
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//		String originFileName = thumbnailImg1.getOriginalFilename();
//		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
//								+ "." + originFileName.substring(originFileName.lastIndexOf(".") +1);
//		String renamePath = folder + "/" + renameFileName;
//		try {
//			thumbnailImg1.transferTo(new File(renamePath));
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("파일 전송 에러 : " + e.getMessage());
//		}
//		return renameFileName;
//	}							
	
	
	
	@RequestMapping("culture.ad")
	public String adminCultureForm() {
		return "admin_culture";
	}
	
	
	@RequestMapping("bkgroup.ad")
	public String adminBgroupForm() {
		return "admin_bGroup";
	}
	
	
}
