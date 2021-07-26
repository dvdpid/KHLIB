package com.kh.klib.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.bkgroup.model.exception.BookGroupException;
import com.kh.klib.books.model.exception.BooksException;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.notice.exception.NoticeException;
import com.kh.klib.notice.model.service.NoticeService;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.notice.model.vo.NoticeSearchValue;

@SessionAttributes("loginUser") 
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("noticeList.nt")
	public ModelAndView noticeList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		int listCount = nService.getNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = nService.selectNoticeList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("noticeList");
		} else {
			throw new BooksException("공지사항 조회 실패!");
		}
		return mv;
	}
	
	@RequestMapping("ndetail.nt")
	public ModelAndView ndetail(@RequestParam("page") int page, @RequestParam("nNo") Integer nNo, ModelAndView mv) {
		
		ArrayList<Notice> nList = nService.selectNDList(nNo);
		if(nList != null) {
			mv.addObject("nList", nList).addObject("page", page).setViewName("noticeDetail");
		} else {
			throw new NoticeException("공지사항 조회 실패!");
		}
		return mv;
	}
	
	@RequestMapping("search.nt")
	public ModelAndView searchNotice(@RequestParam(value="search", required=false) String search,
									@RequestParam(value="searchContent", required=false) String content,
									@RequestParam(value="page", required=false) Integer page,
									ModelAndView mv) {

			NoticeSearchValue nsv = new NoticeSearchValue();
			
			if(search.equals("title")) nsv.setTitle(content);
			else if(search.equals("writer")) nsv.setWriter(content);
			
			System.out.println("nsv : " + nsv);
			
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			
			int searchListCount = nService.searchListCount(nsv);
			
			ArrayList<Notice> list = null;
			
			if(searchListCount != 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
			
			list = nService.selectSearchResultList(nsv, pi);
			
			if(list != null) {
				mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).addObject("pi", pi).setViewName("noticeList");
			} else {
				throw new BookGroupException("공지사항  검색 조회에 실패했습니다.");
				}
			} else {
				mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).setViewName("noticeList");
			}
			
			return mv;
	}
	
}
