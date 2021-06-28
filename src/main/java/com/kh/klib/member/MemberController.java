package com.kh.klib.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.klib.member.model.exception.MemberException;
import com.kh.klib.member.model.service.MemberService;
import com.kh.klib.member.model.vo.Member;

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

	
	@RequestMapping(value ="login.me", method=RequestMethod.POST )
	public String login(Member m, HttpSession session, Model model) {	
		
		Member loginUser = mService.memberLogin(m);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);	
			return "../home";
			
		} else {
			model.addAttribute("msg", "�α��� ����!");
			return "../common/errorPage";
		}	
	}
	
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "../home";
	}
	@RequestMapping("minsert.me")
	public String insertMember(@ModelAttribute Member m, @RequestParam("post") String post,
														 @RequestParam("address1") String address1,
														 @RequestParam("address1") String address2) {
		
		
		String address = post + "/" + address1 + "/" + address2;
		m.setAddress(address);

		// bcrypt ��� : ������ ��ť��Ƽ ��⿡�� �����ϴ� ��ȣȭ ���
		// 		1�� ��ȣȭ �޼��� + �߰� ����(salt�� : ������ �� �̿�)
		
		String encPwd = bcrypPasswordEncoder.encode(m.getPwd());
		m.setPwd(encPwd);
		int result = mService.insertMember(m);
		
		if(result > 0) { // commit ���� ���� �ڵ����� ����
			return "../home";
		} else {
			return "../common/errorPage";
		}
	}
}
