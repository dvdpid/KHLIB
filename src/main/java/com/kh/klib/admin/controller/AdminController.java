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
import com.kh.klib.books.model.exception.BooksException;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.member.model.exception.MemberException;
import com.kh.klib.member.model.vo.Member;
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
		int alistCount = aService.getListadminUserCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		PageInfo api = Pagination.getPageInfo(currentPage, alistCount);
		
		
		ArrayList<Member> list = aService.selectUserList(pi);
		ArrayList<Member> alist = aService.selectadminUserList(api);
		
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", pi).addObject("alist", alist).addObject("api", api).setViewName("admin_user");
		} else {
			throw new BooksException("회원 조회 실패!");
		}
		return mv;
	}
	@RequestMapping("userDelete.ad")
	public String userDelete(@RequestParam(value="no") Integer no, HttpServletRequest request) {
		
		int result = aService.deleteUser(no);
		String referer = request.getHeader("Referer");
		
		if(result > 0) {
			return "redirect:"+ referer;
		} else {
			throw new MemberException("회원 삭제 실패");
		}
		
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
	public String adminBoardForm() {
		return "admin_board";
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
	
	
	@RequestMapping("bkgroup.ad")
	public String adminBgroupForm() {
		return "admin_bGroup";
	}
	@RequestMapping("dupId.ad")
	@ResponseBody
	public String dupId(@RequestParam("id") String id) {
		
		int result = aService.dupId(id);
		return result + "";
	}
	
}
