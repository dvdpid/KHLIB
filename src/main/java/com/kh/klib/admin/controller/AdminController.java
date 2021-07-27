package com.kh.klib.admin.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.admin.model.service.AdminService;
import com.kh.klib.admin.model.vo.AdminSearchValue;
import com.kh.klib.bkgroup.model.exception.BookGroupException;
import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.BookGroupSearchValue;
import com.kh.klib.board.model.exception.BoardException;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.board.model.vo.BoardSearchValue;
import com.kh.klib.books.model.exception.BooksException;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.books.model.vo.SearchCondition;
import com.kh.klib.comments.model.vo.Comments;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.exception.CultureException;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSearchCondition;
import com.kh.klib.member.model.exception.MemberException;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.room.exception.RoomException;
import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

@SessionAttributes("loginUser") 
@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypPasswordEncoder;
	
	@RequestMapping("loginForm.ad")
	public String adminLoginForm() {
		return "admin_login";
	}
	
	@RequestMapping(value = "login.ad", method=RequestMethod.POST)
	public String adminLogin(Member m, Model model) {
		
		Member loginUser = aService.adminLogin(m);
		
		if(bcrypPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			System.out.println(m);
			
			return "admin_user";
			
		} else {
			return "../common/errorPage";
		}
	}
	@RequestMapping("logout.ad")
	public String adminLogout(SessionStatus status) {
		status.setComplete();
		return "admin_user";
	}
	
	
	@RequestMapping("signupForm.ad")
	public String adminSignUpForm() {
		return "admin_SignUp";
	}
	@RequestMapping("signup.ad")
	public String adminSignUp(@ModelAttribute Member m, @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 @RequestParam("address3") String address3,
														 @RequestParam("year") String year,
														 @RequestParam("month") String month,
														 @RequestParam("day") String day	) {
		String address = address1 + "/" + address2 + "/" + address3;
		m.setAddress(address);
		String date = year + "-"+ month + "-"+ day;
		Date d = Date.valueOf(date);
		
		m.setBirthday(d);
		
		
		
		String encPwd = bcrypPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		
		int result = aService.insertAdmin(m);
		
		
		if(result > 0) { 
			return "../home";
		} else {
			return "../common/errorPage";
		}
	}
	
	
	@RequestMapping("user.ad")
	public ModelAndView adminUserForm(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = aService.getListUserCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Member> list = aService.selectUserList(pi);
		
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_user");
		} else {
			throw new BooksException("회원 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("user2.ad")
	public ModelAndView adminUser2Form(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int alistCount = aService.getListadminUserCount();
		
		PageInfo api = Pagination.getPageInfo(currentPage, alistCount);
		
		
		ArrayList<Member> alist = aService.selectadminUserList(api);
		
		
		if(alist != null) {
			mv.addObject("alist", alist).addObject("api", api).setViewName("admin_user2");
		} else {
			throw new BooksException("회원 조회 실패!");
		}
		return mv;
	}
	
	
	
	@RequestMapping("userDeleteForm.ad")
	public ModelAndView userDeleteForm(@RequestParam(value="no") Integer no, ModelAndView mv) {
		ArrayList<Member> uList = aService.deleteUserList(no);
		if(uList != null) {
			mv.addObject("uList", uList);
			mv.setViewName("userSign");
		}else {
			throw new MemberException("조회 실패!");
		}
		return mv;
	}
	
	
	
	@RequestMapping("userDelete.ad")
	public String userDelete(@RequestParam(value="no") Integer no, HttpServletRequest request) {
		
		int result = aService.deleteUser(no);
		String referer = request.getHeader("Referer");
		
		if(result > 0) {
			return "user_ok";
		} else {
			throw new MemberException("회원 삭제 실패");
		}
		
	}
	
	@RequestMapping("adminDeleteForm.ad")
	public ModelAndView adminDeleteForm(@RequestParam(value="no") Integer no, ModelAndView mv) {
		ArrayList<Member> uList = aService.deleteUserList(no);
		if(uList != null) {
			mv.addObject("uList", uList);
			mv.setViewName("userSign");
		}else {
			throw new MemberException("조회 실패!");
		}
		return mv;
	}
	
	@RequestMapping("adminDelete.ad")
	public String adminDelete(@RequestParam(value="no") Integer no, HttpServletRequest request) {
		
		int result = aService.deleteAdmin(no);
		String referer = request.getHeader("Referer");
		if(result > 0) {
			return "redirect:"+ referer;
		} else {
			throw new MemberException("관리자 삭제 실패");
		}
	}
	
	@RequestMapping("board.ad")
	public ModelAndView adminBoardList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = aService.bListCount();
		int cmlistCount = aService.CMListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo cmpi = Pagination.getPageInfo(currentPage, cmlistCount);
		
		
		
		ArrayList<Board> bList = aService.selectBoardList(pi);
		ArrayList<Comments> cmList = aService.selectCommentsList(cmpi);
		
		
		if(bList != null) {
			mv.addObject("bList", bList).addObject("pi", pi).addObject("cmList", cmList).addObject("cmpi", cmpi).setViewName("admin_board");
		} else {
			throw new BoardException("게시글 조회 실패!");
		}
		
		return mv;
	}
	@RequestMapping("comment.ad")
	public ModelAndView adminCommentList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int cmlistCount = aService.CMListCount();
		
		PageInfo cmpi = Pagination.getPageInfo(currentPage, cmlistCount);
		
		
		
		ArrayList<Comments> cmList = aService.selectCommentsList(cmpi);
		
		
		if(cmList != null) {
			mv.addObject("cmList", cmList).addObject("cmpi", cmpi).setViewName("admin_comment");
		} else {
			throw new BoardException("댓글 조회 실패!");
		}
		
		return mv;
	}
	
	
	
	@RequestMapping("room.ad")
	public ModelAndView adminRoomForm(ModelAndView mv, HttpSession session) {
		ArrayList<Room> rlist = aService.selectrList();
		
		int allListCount = aService.getAllListCount();
		int listCount = aService.getrlistCount();
		
		int check = 0;
		if( session.getAttribute("loginUser") == null ) {
			check = 0;
		} else {			
			int uNo = ((Member)session.getAttribute("loginUser")).getNo();
			check = aService.getChk(uNo);
		}
		
		mv.addObject("rlist", rlist).addObject("allListCount", allListCount).addObject("check", check).addObject("listCount", listCount).setViewName("admin_room");
		
		
		return mv;
	}
	@RequestMapping("rSign.ad")
	public ModelAndView rSignForm(@RequestParam Integer rNo, ModelAndView mv) {
		
		
		ArrayList<RoomSign> list = aService.selectNick(rNo);
		mv.addObject("rNo", rNo);
		mv.addObject("list", list);
		mv.setViewName("adminRoomSign");
		
		return mv;
	}
	@RequestMapping("cancelRoom.ad")
	public String cancelRoom(@RequestParam("rNo") Integer rNo, @RequestParam("rsNo") Integer rsNo) {
		System.out.println(rNo);
		System.out.println(rsNo);
		
		int result1 = aService.cancelRoom(rNo);
		int result2 = aService.outTime(rsNo);
		
		if(result1 > 0 && result2 > 0) {
			return "room_ok";
		} else {
			throw new RoomException("퇴실 처리 실패");
		}
	}
	
	
	@RequestMapping("book.ad")
	public ModelAndView adminBookList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = aService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		
		ArrayList<Books> list = aService.selectList(pi);
		
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_book");
		} else {
			throw new BooksException("도서 조회 실패!");
		}
		return mv;
	}
	
	@RequestMapping("book2.ad")
	public ModelAndView adminBookList2(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int relistCount = aService.getReListCount();
		
		PageInfo rpi = Pagination.getPageInfo(currentPage, relistCount);
		
		
		ArrayList<Books> rlist = aService.selectReList(rpi);
		
		
		if(rlist != null) {
			mv.addObject("rlist", rlist).addObject("rpi", rpi).setViewName("admin_book2");
		} else {
			throw new BooksException("도서 조회 실패!");
		}
		return mv;
	}
	
	
	
	
	
	@RequestMapping("bookInsertForm.ad")
	public String bookInsertForm() {
		return "admin_add_book";
	}
	
	@RequestMapping("bkinsert.ad")
	public String insertBook(@ModelAttribute Books b, @RequestParam("thumbnailImg1") MultipartFile thumbnailImg1, HttpServletRequest request) {
		Files f = new Files();
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			String renameFileName = bookSaveFile(thumbnailImg1, request);
			
			if(renameFileName != null) {
				f.setOriginName(thumbnailImg1.getOriginalFilename());
				f.setChangeName(renameFileName);
			}
		}
		
		int result1 = aService.insertBook(b);
		int result2 = aService.insertAttachment(f);
		
		if(result1 > 0 && result2 > 0) {
			return "redirect:book.ad";
		} else {
			throw new BooksException("도서 등록에 실패");
		}
	}
	
	public String bookSaveFile(MultipartFile thumbnailImg1, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/bkuploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = thumbnailImg1.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") +1);
		String renamePath = folder + "/" + renameFileName;
		try {
			thumbnailImg1.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}			
	
	@RequestMapping("bkDelete.ad")
	public ModelAndView bkDeleteForm(@RequestParam("bNo") Integer bNo, ModelAndView mv) {
		
		ArrayList<Books> bList = aService.selectBlist(bNo);
		mv.addObject("bList", bList);
		mv.setViewName("booksSign");
		return mv;
	}
	@RequestMapping("booksDelete.ad")
	public String bkDelete(@RequestParam("bNo") Integer bNo) {
		
		int result = aService.deleteBook(bNo);
		
		if(result > 0) {
			return "book_ok";
		} else {
			throw new BooksException("도서 삭제 실패!");
		}
	}
	
	@RequestMapping("bkUpdateForm.ad")
	public ModelAndView bkUpdateForm(@RequestParam("bNo") Integer bNo,  ModelAndView mv) {
		
		ArrayList<Books> bList = aService.selectBlist(bNo);
		ArrayList<Files> fList = aService.selectBFileName(bNo);
		
		System.out.println(bList);
		System.out.println(fList);
		
		mv.addObject("bList", bList);
		mv.addObject("fList", fList);
		mv.setViewName("admin_update_book");
		return mv;
	}
	@RequestMapping("bkUpdate.ad")
	public String bkUpdate(@ModelAttribute Books b, @RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,@RequestParam("img") String img,@RequestParam("bNo") Integer bNo,  HttpServletRequest request) {
		Files f = new Files();
		if(thumbnailImg1.getOriginalFilename() != "") { // 이미지를 수정했으면
			if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
				String renameFileName = bookSaveFile(thumbnailImg1, request);
				
				if(renameFileName != null) {
					f.setOriginName(thumbnailImg1.getOriginalFilename());
					f.setChangeName(renameFileName);
				}
			}
			
			f.setBkNo(bNo);
			
			int result1 = aService.updateBook(b);
			int result2 = aService.updateBAttachment(f);
			
			if(result1 > 0 && result2 > 0) {
				return "redirect:book.ad";
			} else {
				throw new BooksException("도서 수정에 실패");
			}
		} else { // 이미지를 수정하지 않았으면
			f.setBkNo(b.getbNo());
			int result1 = aService.updateBook(b);
			if(result1 > 0) {
				return "redirect:book.ad";
			} else {
				throw new BooksException("도서 수정에 실패");
			}
		}
	}
	
	
	
	
	
	
	
	@RequestMapping("culture.ad")
	public ModelAndView adminCultureList(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int clistCount = aService.getcListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, clistCount);
		
		ArrayList<Culture> list = aService.selectCList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_culture");
		} else {
			throw new BooksException("도서 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("cultureInsertForm.ad")
	public String insertCultureForm() {
		return "admin_add_culture";
	}
	@RequestMapping("cinsert.ad")
	public String insertCulture(@ModelAttribute Culture c, @RequestParam("uploadFile") MultipartFile uploadFile,
								@RequestParam("thumbnailImg1") MultipartFile thumbnailImg1, HttpServletRequest request) {
		System.out.println(c);
		
		int result1 = aService.insertCulture(c);
		
		
		Files f = new Files();
		if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
			String renameFileName = cultureImgSaveFile(thumbnailImg1, request);
			
			if(renameFileName != null) {
				f.setOriginName(thumbnailImg1.getOriginalFilename());
				f.setChangeName(renameFileName);
			}
		}
		
		int result2 = aService.insertCultureAttachment(f);
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = cultureSaveFile(uploadFile, request);
			
			if(renameFileName != null) {
				f.setOriginName(uploadFile.getOriginalFilename());
				f.setChangeName(renameFileName);
			}
		}
		int result3 = aService.insertCultureFile(f);
		
		if(result1 > 0 && result2 > 0 && result3 >0) {
			return "redirect:culture.ad";
		} else {
			throw new BooksException("문화 등록에 실패");
		}
	}
	// culture 이미지 saveFile
	public String cultureImgSaveFile(MultipartFile thumbnailImg1, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/CultureUploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = thumbnailImg1.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") +1);
		String renamePath = folder + "/" + renameFileName;
		try {
			thumbnailImg1.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}
	
	
	// culture 파일 saveFile
	public String cultureSaveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/CultureUploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String originFileName = uploadFile.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+ "." + originFileName.substring(originFileName.lastIndexOf(".") +1);
		String renamePath = folder + "/" + renameFileName;
		try {
			uploadFile.transferTo(new File(renamePath));
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}
		return renameFileName;
	}	
//	문화마당 삭제
	@RequestMapping("cDeleteForm.ad")
	public ModelAndView cDeleteForm(@RequestParam("cNo") Integer cNo, ModelAndView mv) {
		
		ArrayList<Culture> cList = aService.cDeleteList(cNo);
		
		if(cList != null) {
			mv.addObject("cList", cList).setViewName("cultureSign");
		} else {
			throw new BooksException("도서 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("cultureDelete.ad")
	public String cultureDelete(@RequestParam("cNo") Integer cNo) {
		
		int result = aService.cultureDelete(cNo);
		if(result > 0) {
			return "culture_ok";
		} else {
			throw new CultureException("문화마당 삭제 실패");
		}
	}
	@RequestMapping("cUpdateForm.ad")
	public ModelAndView cUpdateForm(@RequestParam("cNo") Integer cNo,  ModelAndView mv) {
		
		ArrayList<Culture> cList = aService.selectClist(cNo);
		ArrayList<Files> fList = aService.selectCFileName(cNo); // 썸네일 이미지 가져오는 코드
		ArrayList<Files> fList2 = aService.selectCFileName2(cNo); // 썸네일 이미지 가져오는 코드
		
		
		
		mv.addObject("cList", cList);
		mv.addObject("fList", fList);
		mv.addObject("fList2", fList2);
		mv.setViewName("admin_update_culture");
		return mv;
		
	}
	@RequestMapping("cUpdate.ad")
	public String cUpdate(@ModelAttribute Culture c, @RequestParam("thumbnailImg1") MultipartFile thumbnailImg1,
							@RequestParam("cNo") Integer cNo,  HttpServletRequest request,
							@RequestParam("uploadFile") MultipartFile uploadFile) {
		Files f = new Files();
		
		if(thumbnailImg1.getOriginalFilename() != "" && uploadFile.getOriginalFilename() != "") { // 이미지, 파일 둘다 수정했을때
			
			System.out.println("이미지, 파일 둘다 수정하기");
			
			int result1 = aService.updateCulture(c);
			f.setcNo(cNo);
			
			if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
				String renameFileName = cultureImgSaveFile(thumbnailImg1, request);
				
				if(renameFileName != null) {
					f.setOriginName(thumbnailImg1.getOriginalFilename());
					f.setChangeName(renameFileName);
				}
			}
			
			int result2 = aService.updateCAttachment(f);
			
			if(uploadFile != null && !uploadFile.isEmpty()) {
				String renameFileName = cultureSaveFile(uploadFile, request);
				
				if(renameFileName != null) {
					f.setOriginName(uploadFile.getOriginalFilename());
					f.setChangeName(renameFileName);
				}
			}
			
			System.out.println(f.getOriginName());
			System.out.println(f.getChangeName());
			
			int result3 = aService.updateCFile(f);
			
			if(result1 > 0 && result2 > 0 && result3 > 0) {
				return "redirect:culture.ad";
			} else {
				throw new CultureException("문화 수정에 실패");
			}
			
			
		} else if(thumbnailImg1.getOriginalFilename() != ""  && uploadFile.getOriginalFilename() == ""){ // 이미지만 수정했을경우(파일 수정 x)
			
			System.out.println("이미지만 수정하기");
			
			int result1 = aService.updateCulture(c);
			
			if(thumbnailImg1 != null && !thumbnailImg1.isEmpty()) {
				String renameFileName = cultureImgSaveFile(thumbnailImg1, request);
				
				if(renameFileName != null) {
					f.setOriginName(thumbnailImg1.getOriginalFilename());
					f.setChangeName(renameFileName);
				}
			}
			f.setcNo(cNo);
			
			int result2 = aService.updateCAttachment(f);
			
			if(result1 > 0 && result2 > 0 ) {
				return "redirect:culture.ad";
			} else {
				throw new CultureException("문화 수정에 실패");
			}
			
		
		} else if(thumbnailImg1.getOriginalFilename() == ""  && uploadFile.getOriginalFilename() != "") { // 파일만 수정
			
			System.out.println("파일만 수정하기");
			
			int result1 = aService.updateCulture(c);
			
			f.setcNo(cNo);
			
			if(uploadFile != null && !uploadFile.isEmpty()) {
				String renameFileName = cultureSaveFile(uploadFile, request);
				
				if(renameFileName != null) {
					f.setOriginName(uploadFile.getOriginalFilename());
					f.setChangeName(renameFileName);
				}
			}
			
			int result3 = aService.updateCFile(f);
			
			if(result1 > 0 && result3 > 0 ) {
				return "redirect:culture.ad";
			} else {
				throw new CultureException("문화 수정에 실패");
			}
			
		} else {
			System.out.println("내용만 수정하기");
			int result1 = aService.updateCulture(c);
			
			if(result1 > 0 ) {
				return "redirect:culture.ad";
			} else {
				throw new CultureException("문화 수정에 실패");
			}
		}
	}
	
	
	
	
	@RequestMapping("bkgroup.ad")
	public ModelAndView adminBgroupForm(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int bglistCount = aService.getbgListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, bglistCount);
		
		ArrayList<BookGroup> list = aService.selectbgList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_bGroup");
		} else {
			throw new BookGroupException("도서 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("bgDeleteForm.ad")
	public ModelAndView bgDeleteForm(@RequestParam("gNo") Integer gNo, ModelAndView mv) {
		
		ArrayList<BookGroup> gList = aService.gDeleteList(gNo);
		if(gList != null) {
			mv.addObject("gList", gList).setViewName("bookGroupSign");
		}
		
		return mv;
	}
	@RequestMapping("bgDelete.ad")
	public String bgDelete(@RequestParam("gNo") Integer gNo) {
		
		int result = aService.bgDelete(gNo);
		
		if(result > 0) {
			return "bookgroup_ok";
		} else {
			throw new BookGroupException("독서모임 삭제 실패!");
		}
		
	}
	
	
	@RequestMapping("notice.ad")
	public ModelAndView notice(@RequestParam(value="page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = aService.getNoticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notice> list = aService.selectNoticeList(pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).setViewName("admin_notice");
		} else {
			throw new BooksException("회원 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("noticeInsertForm.ad")
	public String noticeInsertForm() {
		return "admin_add_notice";
	}
	@RequestMapping("noticeInsert.ad")
	public String noticeInsert(@ModelAttribute Notice n, HttpSession session) {
		
		System.out.println(n);
		String writer = ((Member)session.getAttribute("loginUser")).getNickname();
		
		n.setnWriter(writer);
		
		int result = aService.InsertNotice(n);
		
		if( result> 0 ) {
			return "redirect:notice.ad";
		} else {
			throw new BooksException("공지사항 등록 실패!");
		}
		
	}
	@RequestMapping("noticeDeleteForm.ad")
	public String noticeDeleteForm(@RequestParam("nNo") Integer nNo, Model model) {
		
		Notice notice = aService.selectDetailNotice(nNo);
		if(notice != null) {
			model.addAttribute("notice", notice);
			return "noticeSign";
		} else {
			throw new BoardException("공지사항 삭제 실패!");
		}
	}
	@RequestMapping("noticeDelete.ad")
	public String noticeDelete(@RequestParam("nNo") Integer nNo) {
		int result = aService.noticeDelete(nNo);
		if(result > 0 ) {
			return "notice_ok";
		} else {
			throw new BoardException("공지사항 삭제 실패!");
		}
	}
	@RequestMapping("noticeUpdateForm.ad")
	public String noticeUpdateForm(@RequestParam("nNo") Integer nNo, Model model) {
		
		Notice notice = aService.selectDetailNotice(nNo);
		if(notice != null) {
			model.addAttribute("notice", notice);
			
			return "admin_update_notice";
		} else {
			throw new BoardException("공지사항 수정 실패!");
		}
		
	}
	@RequestMapping("noticeUpdate.ad")
	public String noticeUpdate(@ModelAttribute Notice n) {
		
		int result = aService.updateNotice(n);
		if(result > 0) {
			return "redirect:notice.ad";
		}else {
			throw new BoardException("공지사항 수정 실패!");
		}
		
	}
	
	
	
	
	
	
	@RequestMapping("searchUser.ad")
	public ModelAndView searchUser(@RequestParam(value="searchContent", required=false) String content,
										@RequestParam(value="page", required=false) Integer page,
										ModelAndView mv) {
		
		AdminSearchValue asv = new AdminSearchValue();
		asv.setWriter(content);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = aService.searchUListCount(asv);
		
		ArrayList<Member> list = null;
		
		int alistCount = aService.getListadminUserCount();
		PageInfo api = Pagination.getPageInfo(currentPage, alistCount);
		ArrayList<Member> alist = aService.selectadminUserList(api);
		
		if(searchListCount != 0) {
		PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
		
		list = aService.selectSearchResultUList(asv, pi);
		
		if(list != null) {
			mv.addObject("list", list).addObject("alist", alist).addObject("api", api).addObject("searchContent", content).addObject("pi", pi).setViewName("admin_user");
		} else {
			throw new MemberException("유저 검색 조회에 실패했습니다.");
			}
		} else {
			mv.addObject("list", list).addObject("alist", alist).addObject("api", api).addObject("searchContent", content).setViewName("admin_user");
		}
		
		return mv;
	}
	
	@RequestMapping("searchAdminUser.ad")
	public ModelAndView searchAdminUser(@RequestParam(value="searchContent", required=false) String content,
										@RequestParam(value="page", required=false) Integer page,
										ModelAndView mv) {
		
		AdminSearchValue asv = new AdminSearchValue();
		asv.setWriter(content);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = aService.searchAUListCount(asv);
		
		ArrayList<Member> alist = null;
		
		int listCount = aService.getListUserCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Member> list = aService.selectUserList(pi);
		
		if(searchListCount != 0) {
		PageInfo api = Pagination.getPageInfo(currentPage, searchListCount);
		
		alist = aService.selectSearchResultAUList(asv, api);
		
			if(alist != null) {
				mv.addObject("list", list).addObject("alist", alist).addObject("api", api).addObject("searchContent", content).addObject("pi", pi).setViewName("admin_user");
			} else {
				throw new MemberException("유저 검색 조회에 실패했습니다.");
				}
			} else {
				mv.addObject("list", list).addObject("alist", alist).addObject("pi", pi).addObject("searchContent", content).setViewName("admin_user");
		}
		
		return mv;
		
	}
	
	@RequestMapping("bDetail.ad")
	public String bDetail(@RequestParam(value="page", required=false) Integer page, @RequestParam("bNo") Integer bNo, Model model) {
		
		Board board = aService.selectDetailBoard(bNo);
		Files file = aService.selectBFile(bNo);
		if(board != null) {
			model.addAttribute("page", page).addAttribute("board", board).addAttribute("file", file);
			return "../board/boardDetail";
		} else {
			throw new BoardException("게시판 상세보기에 실패하였습니다.");
		}
	}
	
	@RequestMapping("boardDeleteForm.ad")
	public String boardDeleteForm(@RequestParam("bNo") Integer bNo,  Model model) {
		
		Board board = aService.selectDetailBoard(bNo);
		if(board != null) {
			model.addAttribute("board", board);
			return "boardSign";
		} else {
			throw new BoardException("게시글 삭제 실패!");
		}
		
	}
	@RequestMapping("boardDelete.ad")
	public String boardDelete(@RequestParam("bNo") Integer bNo) {
		
		int result = aService.boardDelete(bNo);
		if(result > 0 ) {
			return "board_ok";
		} else {
			throw new BoardException("게시글 삭제 실패!");
		}
	}
	@RequestMapping("cmDeleteForm.ad")
	public String cmDeleteForm(@RequestParam("cNo") Integer cNo, Model model) {
		
		model.addAttribute("cNo", cNo);
		
		return "commentsSign";
	}
	@RequestMapping("commentsDelete.ad")
	public String commentsDelete(@RequestParam("cNo") Integer cNo) {
		
		int result = aService.commentDelete(cNo);
		if(result > 0 ) {
			return "comments_ok";
		} else {
			throw new BoardException("댓글 삭제 실패!");
		}
		
	}
	
	
	
	@RequestMapping("searchBoard.ad")
	public ModelAndView searchBoard(@RequestParam(value="search", required=false) String search,
								@RequestParam(value="searchContent", required=false) String content,
								@RequestParam(value="page", required=false) Integer page,
								ModelAndView mv) {

			System.out.println("board 검색 컨트롤러 넘어옴");
			System.out.println(search);
			System.out.println(content);
		
			BoardSearchValue bsv = new BoardSearchValue();
			
			if(search.equals("title")) bsv.setTitle(content);
			else if(search.equals("writer")) bsv.setWriter(content);
			
			System.out.println("bsv : " + bsv);
			
			int currentPage = 1;
				if(page != null) {
				currentPage = page;
			}
			
			int searchListCount = aService.searchBoardListCount(bsv);
			
			int cmlistCount = aService.CMListCount();
			PageInfo cmpi = Pagination.getPageInfo(currentPage, cmlistCount);
			ArrayList<Comments> cmList = aService.selectCommentsList(cmpi);
			
			ArrayList<Board> bList = null;
			
			if(searchListCount != 0) {
				PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
			
				bList = aService.selectSearchBoardResultList(bsv, pi);
			
				System.out.println("검색 board List : "+ bList);
			
			if(bList != null) {
				mv.addObject("bList", bList).addObject("search", search).addObject("cmList", cmList).addObject("cmpi", cmpi).addObject("searchContent", content).addObject("pi", pi).setViewName("admin_board");
			} else {
				throw new BoardException("게시글  검색 조회에 실패했습니다.");
			}
			} else {
				mv.addObject("bList", bList).addObject("search", search).addObject("cmList", cmList).addObject("cmpi", cmpi).addObject("searchContent", content).setViewName("admin_board");
			}
			
			return mv;

	}
	
	@RequestMapping("searchBook.ad")
	public ModelAndView searchBook(@RequestParam(value="search", required=false) String search,
									@RequestParam(value="searchContent", required=false) String content,
									@RequestParam(value="page", required=false) Integer page,
									ModelAndView mv) {
		
		
		SearchCondition sc = new SearchCondition();
		
		if(search != null) {
			if(search.equals("writer")) sc.setWriter(content);
			else if(search.equals("title")) sc.setTitle(content);
			else if(search.equals("company")) sc.setCompany(content);
		}

		
		System.out.println("sc : " + sc);
		
		int currentPage = 1;
			if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = aService.searchBookListCount(sc);
		
		
		ArrayList<Books> list = null;
		
		if(searchListCount != 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
		
			list = aService.selectSearchBookResultList(sc, pi);
		
			System.out.println("검색 board List : "+ list);
		
		if(list != null) {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).addObject("pi", pi).setViewName("admin_book");
		} else {
			throw new BoardException("게시글  검색 조회에 실패했습니다.");
		}
		} else {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).setViewName("admin_book");
		}
		
		return mv;
	}
	
	@RequestMapping("searchCulture.ad")
	public ModelAndView searchCulture(@RequestParam(value="search", required=false) String search,
										@RequestParam(value="searchContent", required=false) String content,
										@RequestParam(value="page", required=false) Integer page,
										ModelAndView mv) {
		
		
		CultureSearchCondition csc = new CultureSearchCondition();
		
		if(search.equals("title")) csc.setTitle(content);
		else if(search.equals("instructor")) csc.setInstructor(content);
		else if(search.equals("place")) csc.setPlace(content);
		else if(search.equals("target")) csc.setTarget(content);
		
		System.out.println("csc : " + csc);
		
		int currentPage = 1;
			if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = aService.searchCultureListCount(csc);
		
		
		ArrayList<Culture> list = null;
		
		if(searchListCount != 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
		
			list = aService.selectSearchCultureResultList(csc, pi);
		
			System.out.println("검색 board List : "+ list);
		
		if(list != null) {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).addObject("pi", pi).setViewName("admin_culture");
		} else {
			throw new BoardException("게시글  검색 조회에 실패했습니다.");
		}
		} else {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).setViewName("admin_culture");
		}
		
		return mv;
	}
	
	@RequestMapping("searchBGroup.ad")
	public ModelAndView searchBGroup(@RequestParam(value="search", required=false) String search,
													@RequestParam(value="searchContent", required=false) String content,
													@RequestParam(value="page", required=false) Integer page,
													ModelAndView mv) {

		
			BookGroupSearchValue gsv = new BookGroupSearchValue();
				
			if(search.equals("name")) gsv.setName(content);
			else if(search.equals("book")) gsv.setBook(content);
			
			System.out.println("gsv" + gsv);
			
			int currentPage = 1;
			if(page != null) {
			currentPage = page;
			}
			
			int searchListCount = aService.searchBGroupListCount(gsv);
			
			
			ArrayList<Culture> list = null;
			
			if(searchListCount != 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, searchListCount);
			
			list = aService.selectSearchBGroupResultList(gsv, pi);
			
			
			if(list != null) {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).addObject("pi", pi).setViewName("admin_bGroup");
			} else {
			throw new BoardException("게시글  검색 조회에 실패했습니다.");
			}
			} else {
			mv.addObject("list", list).addObject("search", search).addObject("searchContent", content).setViewName("admin_bGroup");
			}
			
			return mv;
	}
	
	@RequestMapping("bkRecommend.ad")
	public String bkRecommend(@RequestParam("bNo") Integer bNo) {
		
		int result = aService.bkRecommend(bNo);
		if(result > 0) {
			return "bkRecommend_ok";
		} else {
			throw new BooksException("추천도서 등록 실패!");
		}
		
	}
	
	@RequestMapping("bkCancelRecommend.ad")
	public String bkCancelRecommend(@RequestParam("bNo") Integer bNo) {
		
		int result = aService.bkCancelRecommend(bNo);
		if(result > 0) {
			return "bkRecommend_cancel";
		} else {
			throw new BooksException("추천도서 취소 실패!");
		}
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("dupId.ad")
	@ResponseBody
	public String dupId(@RequestParam("id") String id) {
		
		int result = aService.dupId(id);
		return result + "";
	}
	
}
