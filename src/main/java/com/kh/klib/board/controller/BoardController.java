package com.kh.klib.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.klib.bkgroup.model.exception.BookGroupException;
import com.kh.klib.board.model.exception.BoardException;
import com.kh.klib.board.model.service.BoardService;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.board.model.vo.BoardSearchValue;
import com.kh.klib.comments.model.vo.Comments;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("board.bo")
	public ModelAndView boardListForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = boardService.getListCount();
		System.out.println("전체 게시물 개수 : " + listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Board> list = boardService.selectList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("boardList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("boardWriteForm.bo")
	public String boardWriteForm() {
		return "boardWrite";
	}
	
	@RequestMapping("boardWrite.bo")
	public String boardWrite(@ModelAttribute Board b, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
		Files f = new Files();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				f.setOriginName(uploadFile.getOriginalFilename());
				f.setChangeName(renameFileName);
			}
			
		}
		
		System.out.println("board : " + b);
		System.out.println("files : " + f);
		
		int result = 0;
		int result2 = 0;
		
		if(f.getOriginName() != null) {
			result = boardService.insertBoard(b);
			result2 = boardService.insertFile(f);
		} else {
			result = boardService.insertBoard(b);
			result2 = boardService.insertNFile(f);
		}
		
				
		if(result > 0 && result2 > 0) {
			return "redirect:board.bo";
		} else {
			throw new BoardException("게시글 등록에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		// 파일을 저장하는 메소드
		// request를 이용해 작은 resources > buploadFiles에 접근
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/boardUploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") + 1 );
		
		String renamePath = folder + "/" + renameFileName;
		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 전송 에러 : " + e.getMessage());
		} 
		
		return renameFileName;
	}
	
	@RequestMapping("bdetail.bo")
	public String boardDetail(@RequestParam("page") int page, @RequestParam("bNo") int bNo, Model model) {
		Board board = boardService.selectBoard(bNo);
		Files file = boardService.selectFile(bNo);
		if(board != null) {
			model.addAttribute("page", page).addAttribute("board", board).addAttribute("file", file);
			return "boardDetail";
		} else {
			throw new BoardException("게시판 상세보기에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("bupdateForm.bo")
	public String boardUpdateForm(@RequestParam("bNo") Integer bNo, @RequestParam("page") Integer page, Model model) {
		Board board = boardService.selectBoard(bNo);
		Files file = boardService.selectFile(bNo);
		
		model.addAttribute("board", board).addAttribute("file", file).addAttribute("page", page);
		
		return "boardUpdate";
	}
	
	@RequestMapping("boardUpdate.bo")
	public String boardUpdate(@ModelAttribute Board b, @ModelAttribute Files f,
							  @RequestParam("page") int page,
							  @RequestParam("reloadFile") MultipartFile reloadFile,
							  HttpServletRequest request) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(f.getChangeName() != null) {
				deleteFile(f.getChangeName(), request);
			} 
			
			String renameFileName = saveFile(reloadFile, request);
			
			if(renameFileName != null) {
				f.setOriginName(reloadFile.getOriginalFilename());
				f.setChangeName(renameFileName);
			}
		}
		
		int result = boardService.updateBoard(b);
		int result2 = boardService.updateFile(f);
		
		if(result > 0 && result2 > 0) {
			return "redirect:bdetail.bo?bNo=" + b.getbNo() + "&page=" + page;
		} else {
			throw new BoardException("게시글 수정을 실패하였습니다.");
		}
		
		
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		// 위치 찾기
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/boardUploadFiles";
		
		File f = new File(savePath + "/" + fileName);
		if(f.exists()) {	// 파일이 존재한다면 파일 삭제
			f.delete();
		}
	}
	
	
	@RequestMapping("bdelete.bo")
	public String boardDelete(@RequestParam("bNo") int bNo) {
		int result = boardService.deleteBoard(bNo);
		int result2 = boardService.deleteFiles(bNo);
		
		System.out.println("result : " + result);
		System.out.println("result : " + result2);
		
		if(result > 0 && result2 > 0) {
			return "redirect:board.bo";
		} else {
			throw new BoardException("독서모임 삭제를 실패하였습니다.");
		}
	}
	
	@RequestMapping("search.bo")
	public ModelAndView searchGroup(@RequestParam(value="search", required=false) String search,
									@RequestParam(value="searchContent", required=false) String content,
									@RequestParam(value="page", required=false) Integer page,
									ModelAndView mv) {
		

		BoardSearchValue bsv = new BoardSearchValue();
		
		if(search.equals("title")) bsv.setTitle(content);
		else if(search.equals("writer")) bsv.setWriter(content);
		
		System.out.println("bsv : " + bsv);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = boardService.searchListCount(bsv);
		
		ArrayList<Board> list = null;
		
		if(searchListCount != 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
			
			list = boardService.selectSearchResultList(bsv, pi);
			
			if(list != null) {
				mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).addObject("pi", pi).setViewName("boardList");
			} else {
				throw new BookGroupException("독서모임  검색 조회에 실패했습니다.");
			}
		} else {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).setViewName("boardList");
		}
		
		return mv;
		
	}
	
	@RequestMapping("addComments.bo")
	@ResponseBody
	public String addComments(@RequestParam("cContent") String cContent, @RequestParam("bNo") int bNo, HttpSession session) {
		Comments c = new Comments();
		
		String cWriter = ((Member)session.getAttribute("loginUser")).getNickname();
		c.setcWriter(cWriter);
		c.setbNo(bNo);
		c.setcContent(cContent);
		
		System.out.println("c : " + c);
		
		int result = boardService.insertComments(c);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BoardException("댓글 등록에 실패하였습니다.");
		}
	} 
	
	@RequestMapping("cList.bo")
	public void getCommentsList(@RequestParam("bNo") int bNo, HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<Comments> list = boardService.selectCommentsList(bNo);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder dateGb = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGb.create();
		gson.toJson(list, response.getWriter());
		
	}
	
	
	
}
