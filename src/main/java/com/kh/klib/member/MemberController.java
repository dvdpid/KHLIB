package com.kh.klib.member;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.service.MemberService;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.room.model.vo.RoomSign;

@SessionAttributes("loginUser") 
@Controller 
public class MemberController {
	
	
	
	@Autowired
	private MemberService mService; 
	
	@Autowired
	private BCryptPasswordEncoder bcrypPasswordEncoder;
	
	@RequestMapping("loginForm.me")
	public String LoginForm() {
		return "memberLogin";
	}
	@RequestMapping("enrollView.me")
	public String enrollView() {
		return "memberJoin";
	}
	@RequestMapping("home.do")
	public String errorpage() {
		return "home";
	}
	@RequestMapping("mypageForm.me")
	public ModelAndView mypageForm(ModelAndView mv,HttpSession session) {
		
		int no = ((Member)session.getAttribute("loginUser")).getNo();
		String name = ((Member)session.getAttribute("loginUser")).getNickname();
		
		ArrayList<RoomSign> rlist = mService.selectrList(no);
		ArrayList<Board> blist = mService.selectbList(name);
		
		System.out.println(rlist);
		
		ArrayList<GroupSign> gsList = mService.selectgsList(no);
		ArrayList<BookGroup> gList = mService.selectgList();
		
		ArrayList<CultureSign> csList = mService.selectcsList(no);
		ArrayList<Culture> cList = mService.selectcList();
		
		
		mv.addObject("rlist", rlist).addObject("blist", blist).addObject("gList", gList).addObject("gsList", gsList).addObject("csList", csList).addObject("cList", cList).setViewName("mypage2");
		
		
		return mv;
	}
	
	@RequestMapping("mupdateView.me")
	public String memberUpdateForm() {		
		return "memberUpdate";
	}
	@RequestMapping("memberdelete.me")
	public String memberDeleteForm() {		
		return "memberDelete";
	}
	@RequestMapping("memberCheck.me")
	public String memberCheckForm() {
		return "memberCheck";
	}

	

	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "../home";
	}
	@RequestMapping("joinMember.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("address1") String address1,
														 @RequestParam("address2") String address2,
														 @RequestParam("address3") String address3,
														 @RequestParam("year") String year,
														 @RequestParam("month") String month,
														 @RequestParam("day") String day						
			) {
		
	
		
		String address = address1 + "/" + address2 + "/" + address3;
		m.setAddress(address);
		
		String date = year + "-"+ month + "-"+ day;
		Date d = Date.valueOf(date);		
		m.setBirthday(d);
		
		
		
		String encPwd = bcrypPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		
		int result = mService.insertMember(m);
		
		
		if(result > 0) { 
			return "../home";
		} else {
			return "../common/errorPage";
		}
	}
	@RequestMapping(value = "login.me", method=RequestMethod.POST )
	public String login(Member m, Model model) {
		
		Member loginUser = mService.memberLogin(m);
		
		
		
		if(bcrypPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			
			return "../home";
			
		} else {
			return "../common/errorPage";
		}
	}
	@RequestMapping("dupId.me")
	@ResponseBody
	public String dupId(@RequestParam("id") String id) {
		
		int result = mService.dupId(id);
		return result + "";
	}
	
	@RequestMapping("dupnickname.me")
	@ResponseBody
	public String dupNickname(@RequestParam("nickname") String nickname) {
		
		int result = mService.nickname(nickname);
		return result + "";
	}
	
	@RequestMapping("mCheck.me")
	public String mCheck(@RequestParam("pwd")String pwd,HttpSession session) {
		
		String id = ((Member)session.getAttribute("loginUser")).getId();
		

		Member loginUser = mService.mlistcheck(id);

		if(bcrypPasswordEncoder.matches(pwd, loginUser.getPwd())) {						
			return "memberDelete2";		
		} else {
			return "../common/errorPage";
		}
	}
	@RequestMapping("mCheck2.me")
	public String mCheck2(@RequestParam("pwd")String pwd,HttpSession session,Model model) {
		
		String id = ((Member)session.getAttribute("loginUser")).getId();
		

		Member loginUser = mService.mlistcheck(id);                          
		
		String address = ((Member)session.getAttribute("loginUser")).getAddress();
		String[] array=address.split("/");
		
		String address1 =array[0];
		String address2 =array[1];
		String address3 =array[2];
		
		Date birthday = ((Member)session.getAttribute("loginUser")).getBirthday();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		String birthday2 = fm.format(birthday);
		
		String[] array2 = birthday2.split("-");
		
		String year=array2[0];
		String month=array2[1];
		String day=array2[2];
		
		
		
		if(bcrypPasswordEncoder.matches(pwd, loginUser.getPwd())) {						
			model.addAttribute("address1",address1);
			model.addAttribute("address2",address2);
			model.addAttribute("address3",address3);	
			
			model.addAttribute("year",year);
			model.addAttribute("month",month);
			model.addAttribute("day",day);
			
			return "memberUpdate";	
						
		} else {
			return "../common/errorPage";
		}
	}
	
	@RequestMapping("mupdate.me")
	public String memberUpdate(@ModelAttribute Member m, @RequestParam("address1") String address1,
			 @RequestParam("address2") String address2,
			 @RequestParam("address3") String address3,
			 @RequestParam("year") String year,
			 @RequestParam("month") String month,
			 @RequestParam("day") String day,	
			 Model model,SessionStatus s) {
		
		
		String address = address1 + "/" + address2 + "/" + address3;
		m.setAddress(address);
		
		String date = year + "-"+ month + "-"+ day;
		Date d = Date.valueOf(date);		
		m.setBirthday(d);
		
		String encPwd = bcrypPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		
		System.out.println(m);
		
		
		int result = mService.updateMember(m);
		
		if(result > 0) {
			Member loginUser = mService.memberLogin(m);
			model.addAttribute("loginUser", loginUser);
			
			s.setComplete();
			return "../home";
		} else {
			return "../common/errorPage";
		}
	}
	
	
	@RequestMapping("mdelete.me")
	public String memberDelete(HttpSession session,SessionStatus s) {
		
		String id = ((Member)session.getAttribute("loginUser")).getId();
		
		int result = mService.deleteMember(id);
		
		if(result > 0) {
			s.setComplete();
			return "../home";
		} else {
			return "../common/errorPage";
		}		
	}
	
	@RequestMapping("memberFind.me")
	public String findForm() {
		return "memberFind";
	}
	
	@ResponseBody
	@RequestMapping(value="findPwd.me", method = RequestMethod.POST)
	public String findPwdPOST(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
		mService.findPwd(response, member);
		System.out.println("pwd: "+member.getPwd());
		String encPwd = bcrypPasswordEncoder.encode(member.getPwd());
		member.setPwd(encPwd);
		
		int result = mService.updatePwd(member);
		System.out.println("result: " + result);
		if(result > 0) {
			System.out.println("result: " + result);
			return "memberFind";
		} else {
			return "../common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="findId.me", method = RequestMethod.POST)
	public String findIDPOST(@ModelAttribute Member member, @RequestParam("email") String email, 
							 @RequestParam("name") String name, @RequestParam("tel") String phone){
		Member m = new Member();
		m.setEmail(email);
		m.setName(name);
		m.setPhone(phone);
		
		String result = mService.findId(m);
		if(result != null) {
			return result;
		} else {
			return null;
		}
		
		
	}

}
