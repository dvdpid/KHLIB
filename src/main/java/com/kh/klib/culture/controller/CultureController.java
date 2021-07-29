package com.kh.klib.culture.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.common.ThumbnailPagination;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.exception.CultureException;
import com.kh.klib.culture.model.service.CultureService;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSearchCondition;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.vo.Member;

@Controller
public class CultureController {
	
	@Autowired
	private CultureService cService;
	
	@RequestMapping("culture.cu")
	public ModelAndView cultureList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		// page : view에서 넘겨받은 변수
		// 페이징 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getListCount();
		
		int cNo = 0;
		int approvalCount = 0;
		
		// 페이징 처리를 위한 연산
		PageInfo pi = ThumbnailPagination.getPageInfo(currentPage, listCount);

		ArrayList<Culture> cList = cService.selectTList(pi, 1); // 게시판 리스트 가져오기
		ArrayList<Files> fList = cService.selectTList(pi, 2); // 파일 리스트 가져오기
		
		ArrayList<CultureSign> csList = new ArrayList<CultureSign>();
		
		for(int i = 0; i < cList.size(); i++) {
			cNo = cList.get(i).getcNo();
			
			approvalCount = cService.getApprovalCount(cNo);
			
			csList.add(i, new CultureSign(cNo, approvalCount));
			
		}
		
		if(cList != null && fList != null) {
			mv.addObject("pi", pi).addObject("cList", cList).addObject("csList", csList).addObject("fList", fList).setViewName("cultureList");
		} else {
			throw new CultureException("프로그램 전체 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("search.cu")
	public ModelAndView searchForm(@RequestParam(value="searchCondition", required=false) String condition, 
								   @RequestParam(value="searchValue", required=false) String value,
								   @RequestParam(value="page", required=false) Integer page,
								   ModelAndView mv) {
		
		CultureSearchCondition csc = new CultureSearchCondition();
		if(condition.equals("title")) csc.setTitle(value);
		else if(condition.equals("instructor")) csc.setInstructor(value);
		else if(condition.equals("place")) csc.setPlace(value);
		else if(condition.equals("target")) csc.setTarget(value);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getSearchResultListCount(csc);
		
		int cNo = 0;
		int approvalCount = 0;
		
		ArrayList<Culture> cList = null;
		ArrayList<Files> fList = null;	
		ArrayList<CultureSign> csList = new ArrayList<CultureSign>();
		
		if(listCount != 0) {
			PageInfo pi = ThumbnailPagination.getPageInfo(currentPage, listCount);
			
			cList = cService.selectSearchResultTList(csc, pi, 1); // 게시판 리스트 가져오기
			fList = cService.selectSearchResultTList(csc, pi, 2); // 파일 리스트 가져오기
			
			if(cList != null && fList != null) {
				mv.addObject("cList", cList).addObject("fList", fList).addObject("csList", csList).addObject("searchCondition", condition).addObject("pi", pi).addObject("searchValue", value).setViewName("cultureList");
			} else {
				throw new CultureException("프로그램 전체 조회에 실패하였습니다.");
			}
		} else {
			mv.addObject("cList", cList).addObject("fList", fList).addObject("csList", csList).addObject("searchCondition", condition).addObject("searchValue", value).setViewName("cultureList");
		}
		return mv;
	}
	
	@RequestMapping("cultureMypage.cu")
	public String cultureMypageForm(@ModelAttribute CultureSign cs, HttpSession session, Model model) {
		if(session.getAttribute("loginUser") == null) {
			return"cultureMypage";
		}
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();
		ArrayList<CultureSign> csList = cService.selectList(uNo);
		ArrayList<Culture> cList = cService.selectcList();
		if(csList != null) {
			model.addAttribute("csList", csList);
			model.addAttribute("cList", cList);
		}
		return"cultureMypage";
	}
	
	@RequestMapping("cultureInfo.cu")
	public String cultureInfoForm() {
		return"cultureInfo";
	}
	
	@RequestMapping("cDetail.cu")
	public String cultureDetail(@RequestParam(value="page", required=false) Integer page,
								@RequestParam("cNo") Integer cNo, Model model,
								@ModelAttribute CultureSign cs) {
		
		Culture culture = cService.selectCulture(cNo);
		ArrayList <Files> files = cService.selectFiles(cNo);
		int approvalCount = cService.getApprovalCount(cNo);
		
		ArrayList<CultureSign> csList = cService.selectcsList(cNo);
		
		model.addAttribute("culture", culture).addAttribute("files", files).addAttribute("page", page);
		model.addAttribute("approvalCount", approvalCount).addAttribute("csList", csList);
		
		return "cultureDetail";
	}
	
	@RequestMapping("cSign.cu")
	public ModelAndView cultureSignForm(@RequestParam("cNo") Integer cNo, ModelAndView mv) {
		
		Culture culture = cService.selectCulture(cNo);
		// 수강 신청하기 위해 선택한 프로그램 정보 가져옴
		int approvalCount = cService.getApprovalCount(cNo);
		// 해당 프로그램의 수강 신청 확정자 카운트
		
		mv.setViewName("programSign");
		mv.addObject("culture", culture);
		mv.addObject("approvalCount", approvalCount);
		return mv;
	}
	
	@RequestMapping("cupdate.cu")
	public String updateCulture(@ModelAttribute CultureSign cs,
							    @RequestParam("cNo") Integer cNo,
							    HttpSession session) {
		
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();
		cs.setuNo(uNo);
		cs.setcNo(cNo);
		
		int result = cService.insertCultureSign(cs);
		// 프로그램 수강 신청 시, 신청한 사람 정보 삽입
		if(result > 0) {
			return "ok";
		} else {
			throw new CultureException("프로그램 신청에 실패하였습니다.");
		}
	}
	
	@RequestMapping("cancel.cu")
	public ModelAndView cancelCulture(ModelAndView mv, @ModelAttribute CultureSign cs,
									  @RequestParam("uNo") Integer uNo,
									  @RequestParam("cNo") Integer cNo) {
		cs.setuNo(uNo);
		cs.setcNo(cNo);
		int result = cService.cancelCulture(cs);
		// 수강 취소 시,수강 확정(cs_approval)과 수강 신청(cs_status)을 'N'으로 변경
		
		if(result > 0) {
			mv.addObject("result", result).setViewName("cultureMypage");
		} else {
			throw new CultureException("수강 취소에 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("delete.cu")
	public ModelAndView deleteCulture(ModelAndView mv, @ModelAttribute CultureSign cs,
									  @RequestParam("uNo") Integer uNo,
									  @RequestParam("cNo") Integer cNo) {
		cs.setuNo(uNo);
		cs.setcNo(cNo);
		int result = cService.cancelCulture(cs);
		int deleteCS = cService.deleteCS(cs);
		// mypage에 있는 내역 삭제 시, 해당 프로그램과 유저 번호가 있는 명단 삭제 (삭제 안하면 같은 프로그램 수강 신청 불가능)
		// view단에서 수강 취소하지 않으면 삭제 불가능하게 설정함
		
		if(result > 0) {
			if(deleteCS > 0) {
				mv.addObject("deleteCS", deleteCS).setViewName("cultureMypage");
			}
		}
		
		return mv;
	}
	
	@RequestMapping("csMemberList.cu")
	public ModelAndView CultureSignMemberList(@RequestParam("cNo") Integer cNo,
												@RequestParam("approvalCount") Integer approvalCount,
												HttpSession session, ModelAndView mv) {
		
		Culture culture = cService.selectCulture(cNo);
		ArrayList<CultureSign> csList = cService.selectcsList(cNo);
		
		Member memInfo = new Member();
		ArrayList<Member> memInfoList = new ArrayList<Member>();
		
		int csUno = 0;
		
		for(int i = 0; i < csList.size(); i++) {
			csUno= csList.get(i).getuNo();
			memInfo = cService.selectMember(csUno);
			memInfoList.add(memInfo);
		}
		mv.addObject("csList", csList).addObject("culture", culture);
		mv.addObject("memInfoList", memInfoList).addObject("approvalCount", approvalCount);
		mv.setViewName("CultureSignMemberList");
		
		
		return mv;
	}
	
	@RequestMapping("csMemberApply.cu")
	@ResponseBody
	public String csMemberApply(@RequestParam("cNo") Integer cNo, @RequestParam("uNo") Integer uNo ) {
		
		
		CultureSign cs = new CultureSign();
		cs.setcNo(cNo);
		cs.setuNo(uNo);
		
		int result = cService.updateCsMemberApply(cs);
		if(result > 0) {
			return "success";
		} else {
			throw new CultureException("문화마당 신청 승인 실패!");
		}
	}
	@RequestMapping("csMemberNoApply.cu")
	@ResponseBody
	public String csMemberNoApply(@RequestParam("cNo") Integer cNo, @RequestParam("uNo") Integer uNo ) {
		
		CultureSign cs = new CultureSign();
		cs.setcNo(cNo);
		cs.setuNo(uNo);
		
		int result = cService.updateCsMemberNoApply(cs);
		if(result > 0) {
			return "success";
		} else {
			throw new CultureException("문화마당 신청 거절 실패!");
		}
		
	}
	
}
