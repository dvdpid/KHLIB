package com.kh.klib.room.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.member.model.vo.Member;
import com.kh.klib.room.exception.RoomException;
import com.kh.klib.room.model.service.RoomService;
import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService rService;
	
	@RequestMapping("room.ro")
	public ModelAndView roomMainForm(ModelAndView mv, HttpSession session) {
		ArrayList<Room> rlist = rService.selectrList();
		
		int allListCount = rService.getAllListCount();
		int listCount = rService.getlistCount();
		
		int check = 0;
		if( session.getAttribute("loginUser") == null ) {
			check = 0;
		} else {			
			int uNo = ((Member)session.getAttribute("loginUser")).getNo();
			check = rService.getChk(uNo);
		}
		
		mv.addObject("rlist", rlist).addObject("allListCount", allListCount).addObject("check", check).addObject("listCount", listCount).setViewName("roomMain");
		
		return mv;
	}
	
	@RequestMapping("roomMypage.ro")
	public ModelAndView roomMypageForm(ModelAndView mv, @ModelAttribute RoomSign rs, HttpSession session) {
		if( session.getAttribute("loginUser") == null ) {
			String msg = "로그인 후 이용 가능합니다.";
			mv.addObject("msg", msg).setViewName("roomMypage");
			return mv;
		}else {
			int uNo = ((Member)session.getAttribute("loginUser")).getNo();
			ArrayList<RoomSign> rsList = rService.selectrsList(uNo);
			ArrayList<RoomSign> rsBeforeList = rService.selectrsBeforeList(uNo);
			
			if(rsList != null) {
				mv.addObject("rsList", rsList);
			}
			if(rsBeforeList != null) {
				mv.addObject("rsBeforeList", rsBeforeList);
			}
			
			mv.setViewName("roomMypage");
			
			return mv;
		}
	}
	
	@RequestMapping("roomInfo.ro")
	public String roomInfoForm() {
		return "roomInfo";
	}
	
	@RequestMapping("rSign.ro")
	public ModelAndView rSignForm(@RequestParam Integer rNo, ModelAndView mv) {
		
		mv.setViewName("roomSign");
		mv.addObject("rNo", rNo);
		
		return mv;
	}
	
	@RequestMapping("rupdate.ro")
	public String updateRoom(@ModelAttribute Room r,
							 @ModelAttribute RoomSign rs,
							 @RequestParam("rNo") Integer rNo,
							 HttpSession session,
							 Model model) {
		int listResult = rService.updateRoom(r);
		
		int uNo = ((Member)session.getAttribute("loginUser")).getNo();
		String nickName = ((Member)session.getAttribute("loginUser")).getNickname();
		rs.setuNo(uNo);
		rs.setrNo(rNo);
		rs.setrStatus(r.getrStatus());
		rs.setNickName(nickName);
		
		
		if(listResult > 0) {
			int result = rService.insertRoomSign(rs);
			System.out.println("rs2 : "+rs);
			if(result > 0) {
				return "ok";
			} else {
				throw new RoomException("열람실 예약에 실패하였습니다.");
			}
		} else {
			throw new RoomException("열람실 예약에 실패하였습니다.");
		}
	}
	
	@ResponseBody
	@RequestMapping("cancelRoom.ro")
	public ModelAndView cancelRoom(ModelAndView mv, @ModelAttribute RoomSign rs, 
								   @RequestParam("uNo") Integer uNo,
								   @RequestParam("rNo") Integer rNo) {
		
		System.out.println("rs" + rs);
		System.out.println("rNo : "+ rNo);
		System.out.println("uNo : "+ uNo);
		int result = 0;
		int updateStatus = 0;
		if(rs.getOutTime() == null) {
			result = rService.cancelRoom(uNo);
			if(result > 0) {
				updateStatus = rService.updateStatus(rNo); 
			} else {
				throw new RoomException("좌석 반납에 실패하였습니다.");
			}
		} else {
			throw new RoomException("좌석 반납에 실패하였습니다.");
		}
		
		mv.addObject("result", result).addObject("updateStatus", updateStatus).setViewName("roomMypage");
		
		return mv;
		
	}
	
	
	
	
	
}
