package com.kh.klib.bkgroup.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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

import com.kh.klib.bkgroup.model.exception.BookGroupException;
import com.kh.klib.bkgroup.model.service.GroupService;
import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.BookGroupSearchValue;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.common.ThumbnailPagination;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.member.model.vo.Member;

@Controller
public class BookGroupController {
	
	@Autowired
	private GroupService gService;
	
	@RequestMapping("bkgroup.bg")
	public ModelAndView bkgroupListForm(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
										// view에서 넘겨받은 page
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		// 전체 게시물 개수 
		int listCount = gService.getListCount();
		System.out.println("전체 게시물 개수 : " + listCount);
		
		PageInfo pi = ThumbnailPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<BookGroup> gList = gService.selectTList(pi, 1);
		ArrayList<Files> fList = gService.selectTList(pi, 2);
		
		int gNo = 0;
		int signMemberCount = 0;
		
		ArrayList<GroupSign> gsList = new ArrayList<GroupSign>();
		
		
		for(int i = 0; i < gList.size(); i++) {
			gNo = gList.get(i).getgNo();
			System.out.println(i + " : " + gNo);
			
			signMemberCount = gService.getSignMemberCount(gNo);
			
			
			gsList.add(i, new GroupSign(gNo, signMemberCount));
			
		}
		
		
		
		
		if((gList != null) || fList != null ) {
			mv.addObject("gList", gList).addObject("fList", fList).addObject("pi", pi).setViewName("bkGroupList");
			mv.addObject("gsList", gsList);
		} else {
			throw new BookGroupException("독서 모임 게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	
	@RequestMapping("bkgroupInsertForm.bg")
	public String bkgroupInsertForm() {
		return "bkGroupInsertForm";
	}
	
	@RequestMapping("bkgroupInsert.bg")
	public String insertGroup(@ModelAttribute BookGroup g, @RequestParam("mainIntro") String intro1, @RequestParam("subIntro") String intro2,
							  @RequestParam("address2") String address2, @RequestParam("resultX") double resultX, @RequestParam("resultY") double resultY,
							  @RequestParam(value="thumbnailImg1", required = false) MultipartFile uploadFile, HttpServletRequest request) {
		
		String intro = intro1 + "/" + intro2;
		g.setgIntro(intro);
		
		String address = g.getgPlace() + "/" + address2 + "/" + resultX + "/" + resultY;
		g.setgPlace(address);
		
		System.out.println(g);
		
		
		int result = gService.insertGroup(g);

		Files f = new Files();
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				f.setOriginName(uploadFile.getOriginalFilename());
				f.setChangeName(renameFileName);
			}
		}
		
		
		int result2 = gService.insertFile(f);
		
		if(result > 0 && result2 > 0) {
			return "redirect:bkgroup.bg";
		} else {
			throw new BookGroupException("독서모임 등록에 실패하였습니다.");
		}
		
	}
	
	public String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/guploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
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
	
	
	@RequestMapping("gDetail.bg")
	public String groupDetail(@RequestParam(value="page", required = false) Integer page, @RequestParam("gNo") Integer gNo, Model model) {
		BookGroup group = gService.selectBookGroup(gNo);
		Files file = gService.selectFile(gNo);
		
		int signMemberCount = gService.getSignMemberCount(gNo);
		
		if(group != null && file != null) {
			model.addAttribute("page", page).addAttribute("file", file).addAttribute("group", group);
			model.addAttribute("signMemberCount", signMemberCount);
			return "bkGroupDetailForm";
		} else {
			throw new BookGroupException("독서모임 상세보기에 실패하였습니다.");
		}
	}

	
	@RequestMapping("bkGroupUpdateForm.bg")
	public String updateGroup(@RequestParam("gNo") int gNo, @RequestParam("page") int page, Model model) {
		BookGroup group = gService.selectBookGroup(gNo);
		Files file = gService.selectFile(gNo);
		
		model.addAttribute("group", group).addAttribute("file", file).addAttribute("page", page);
		
		return "bkGroupUpdateForm";
	}
	

	@RequestMapping("bkgroupUpdate.bg")
	public String updateGroup(@ModelAttribute BookGroup group, @RequestParam("mainIntro") String intro1, @RequestParam("subIntro") String intro2,
							  @RequestParam("address2") String address2, @RequestParam("resultX") double resultX, @RequestParam("resultY") double resultY,
							  @RequestParam("page") int page, @ModelAttribute Files f,
							  @RequestParam("thumbnailImg1") MultipartFile reloadFile,
							  HttpServletRequest request) {
	
		String intro = intro1 + " / " + intro2;
		group.setgIntro(intro);
		
		String address = group.getgPlace() + "/" + address2 + "/" + resultX + "/" + resultY;
		group.setgPlace(address);
		
		
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

		int result = gService.updateGroup(group);
		int result2 = gService.updateFile(f);
		
		
		
		if(result > 0 && result2 > 0) {
			return "redirect:gDetail.bg?gNo=" + group.getgNo() + "&page=" + page;
		} else {
			throw new BookGroupException("독서 모임 게시글 수정을 실패하였습니다.");
		}
		
	
	}

	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "guploadFiles";
		
		File f = new File(savePath + "/" + fileName);
		
		if(f.exists()) {
			f.delete();
		}
		
	}
	
	
	@RequestMapping("gdelete.bg")
	public String deleteGroup(@RequestParam("gNo") int gNo) {
		int result = gService.deleteGroup(gNo);
		int result2 = gService.deleteFiles(gNo);
		
		if(result > 0 && result2 > 0) {
			return "redirect:bkgroup.bg";
		} else {
			throw new BookGroupException("독서모임 삭제를 실패하였습니다.");
		}
	}
	
	
	@RequestMapping("search.bg")
	public ModelAndView searchGroup(@RequestParam(value="search", required=false) String search,
									@RequestParam(value="searchContent", required=false) String content,
									@RequestParam(value="page", required=false) Integer page,
									ModelAndView mv) {
		

		BookGroupSearchValue gsv = new BookGroupSearchValue();
		
		if(search.equals("name")) gsv.setName(content);
		else if(search.equals("place")) gsv.setPlace(content);
		else if(search.equals("book")) gsv.setBook(content);
		
		System.out.println(gsv);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int searchListCount = gService.searchListCount(gsv);
		
		ArrayList<BookGroup> gList = null;
		ArrayList<Files> fList = null;
		
		int gNo = 0;
		int signMemberCount = 0;
		
		ArrayList<GroupSign> gsList = new ArrayList<GroupSign>();
		
		if(searchListCount != 0) {
			PageInfo pi = ThumbnailPagination.getPageInfo(currentPage, searchListCount);
			
			gList = gService.selectSearchResultTList(gsv, pi, 1);
			fList = gService.selectSearchResultTList(gsv, pi, 2);
			
			for(int i = 0; i < gList.size(); i++) {
				gNo = gList.get(i).getgNo();
				System.out.println(i + " : " + gNo);
				
				signMemberCount = gService.getSignMemberCount(gNo);
				
				
				gsList.add(i, new GroupSign(gNo, signMemberCount));
				
			}
			
			if(gList != null && fList != null) {
				mv.addObject("gList", gList).addObject("fList", fList).addObject("search", search).addObject("searchContent", content).addObject("pi", pi).setViewName("bkGroupList");
				mv.addObject("gsList", gsList);
			} else {
				throw new BookGroupException("독서모임  검색 조회에 실패했습니다.");
			}
		} else {
			mv.addObject("gList", gList).addObject("fList", fList).addObject("search", search).addObject("searchContent", content).setViewName("bkGroupList");
			mv.addObject("gsList", gsList);
		}
		
		return mv;
		
	}
	

	@RequestMapping("gApply.bg")
	public ModelAndView bkGroupApply(@RequestParam("gNo") int gNo,
									 @RequestParam("page") int page,
									 HttpSession session,
									 ModelAndView mv) {
		
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();
		
		Member m = gService.selectMember(uNo);
		BookGroup group = gService.selectGroup(gNo);
		
		
		if(group != null) {
			mv.addObject("member", m).addObject("group", group).addObject("page", page).setViewName("bkGroupApplyForm");
		} else {
			throw new BookGroupException("독서모임  신청에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("realApply.bg")
	@ResponseBody
	public String realApply(@RequestParam("gNo") int gNo, @RequestParam("uNo") int uNo,
								  HttpSession session) {
		
		// 신청 -> 사용자 정보 + 모임 정보 보내기
		Member m = gService.selectMember(uNo);
		BookGroup group = gService.selectGroup(gNo);
		
		GroupSign gs = new GroupSign();
		
		gs.setgNo(gNo);
		gs.setuNo(uNo);
		
		int result = gService.insertGroupSign(gs);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BookGroupException("독서모임  신청 삽입 실패");
		}
		
	}
	
	@RequestMapping("bkgroupMyPage.bg")
	public String bkgroupMyPage(HttpSession session, Model model) {
	
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();
		int gsListCount = gService.selectGroupSignListCount(uNo);
		// 유저가 신청한 모임 카운트
		
		ArrayList<BookGroup> bgList = gService.selectBookGroupList();
		ArrayList<GroupSign> gsList = new ArrayList<GroupSign>();
		gsList = gService.selectGroupSign(uNo);
		
		String gsStatus;
		String gsApproval;
		Date gsDate;

		int gNo = 0;
		int signMemberCount = 0;
		
		for(int i = 0; i < gsList.size(); i++) {
			gNo = gsList.get(i).getgNo();
			
			gsStatus = gsList.get(i).getGsStatus();
			gsApproval = gsList.get(i).getGsApproval();
			gsDate = gsList.get(i).getGsDate();
			
			signMemberCount = gService.getSignMemberCount(gNo);

			gsList.set(i, new GroupSign(gNo, uNo, gsStatus, gsApproval, gsDate, signMemberCount));
		}
		
		
		model.addAttribute("gsListCount", gsListCount).addAttribute("bgList", bgList);
		model.addAttribute("gsList", gsList);
		
		
		return "bkGroupMyPage";
		
	}
	
	@RequestMapping("gsCancel.bg")
	public String gsCancle(@RequestParam("gNo") int gNo, @RequestParam("uNo") int uNo) {
		GroupSign gs = new GroupSign();
		gs.setgNo(gNo);
		gs.setuNo(uNo);
		
		int result = gService.deleteGsCancle(gs);
		
		if(result > 0) {
			return "redirect:bkgroupMyPage.bg";
		} else {
			throw new BookGroupException("독서모임 삭제를 실패하였습니다.");
		}
	}
	
	@RequestMapping("bkGroupMyWrite.bg")
	public String bkGroupMyWrite(HttpSession session, Model model) {
		// 내가 작성한 글 가져오기
		String nickname = ((Member)session.getAttribute("loginUser")).getNickname();
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();
		
		
		ArrayList<BookGroup> gList = gService.selectMyBookGroupList(nickname);	// 작성한 게시글 
		ArrayList<GroupSign> gsList = new ArrayList<GroupSign>();
		ArrayList<GroupSign> allGsList = new ArrayList<GroupSign>();		// gsList 저장하는 arrayList
		ArrayList<GroupSign> memCountList = new ArrayList<GroupSign>();		// signMemberCount 저장해서 list로 보내기
		
		
		System.out.println("gList : " + gList);
		
		Integer gNo = 0;
		Integer signUno = 0;
		Integer signMemberCount = 0;
		
		String gsStatus;
		String gsApproval;
		Date gsDate;
		
		for(int i = 0; i < gList.size(); i++) {
			gNo = gList.get(i).getgNo();
		
			// 내가 작성한 글 중 신청자가 있는 모임 리스트 가져오기.
			gsList = gService.selectgroupSignGno(gNo);
			
			signMemberCount = gService.getSignMemberCount(gNo);
			
			if(!gsList.isEmpty()){
				memCountList.add(new GroupSign(gNo, signMemberCount));
			} else if(gsList.isEmpty()) {
				memCountList.add(new GroupSign(gNo, signMemberCount));
				gsList.add(new GroupSign(gNo, signMemberCount));
			} 
				
			
			allGsList.addAll(gsList);
			
			System.out.println("gList list : " + gList);
			
			System.out.println("gsList list : " + gsList);
			
			System.out.println("allGsList : " + allGsList);
			
			System.out.println("signMemberCount : " + signMemberCount);
		}
		
		
		model.addAttribute("gList", gList).addAttribute("allGsList", allGsList);
		model.addAttribute("memCountList", memCountList);
		
		return "bkGroupMyWrite";
	}
	
	@RequestMapping("gsMemberList.bg")
	public ModelAndView GroupSignMemberList(@RequestParam("gNo") Integer gNo,
											@RequestParam("signMemberCount") Integer signMemberCount,
											HttpSession session, ModelAndView mv) {
		
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();	
		
		BookGroup group = gService.selectBookGroup(gNo);
		ArrayList<GroupSign> gsList = gService.selectgroupSignGno(gNo);
		Member memInfo = new Member();
		ArrayList<Member> memInfoList = new ArrayList<Member>();
		
		int gsUno = 0;
		
		for(int i = 0; i < gsList.size(); i++) {
			gsUno= gsList.get(i).getuNo();
			memInfo = gService.selectMember(gsUno);
			memInfoList.add(memInfo);
		}
		
		
		mv.addObject("gsList", gsList).addObject("group", group);
		mv.addObject("memInfoList", memInfoList).addObject("signMemberCount", signMemberCount);
		mv.setViewName("GroupSignMemberList");
		
		return mv;
	}
	
	@RequestMapping("gsMemberApply.bg")
	@ResponseBody
	public String gsMemberApply(@RequestParam("gNo") int gNo, @RequestParam("uNo") int uNo) {
		
		GroupSign gs = new GroupSign();
		
		gs.setgNo(gNo);
		gs.setuNo(uNo);
		
		int result = gService.updateGsMemberApply(gs);
		System.out.println("result : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BookGroupException("독서 모임 신청에 대한 승인 실패");
		}
		
	}
	
	@RequestMapping("gsMemberNoApply.bg")
	@ResponseBody
	public String gsMemberNoApply(@RequestParam("gNo") int gNo, @RequestParam("uNo") int uNo) {
		
		GroupSign gs = new GroupSign();
		
		gs.setgNo(gNo);
		gs.setuNo(uNo);
		
		int result = gService.updateGsMemberNoApply(gs);
		System.out.println("result : " + result);
		
		if(result > 0) {
			return "success";
		} else {
			throw new BookGroupException("독서 모임 신청에 대한 거절 실패");
		}
		
	}
	
	
	@RequestMapping("deadline.bg")
	public String updateDeadLine(@RequestParam("gNo") int gNo) {
		
		int result = gService.updateDeadLine(gNo);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			return "redirect:bkGroupMyWrite.bg";
		} else {
			throw new BookGroupException("독서모임 마감을 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("noDeadline.bg")
	public String updateNoDeadLine(@RequestParam("gNo") int gNo) {
		
		int result = gService.updateNoDeadLine(gNo);
		
		System.out.println("result : " + result);
		
		if(result > 0) {
			return "redirect:bkGroupMyWrite.bg";
		} else {
			throw new BookGroupException("독서모임 마감 취소를 실패하였습니다.");
		}
		
	}
	
	
	
	
	
	
	
	
	
}
