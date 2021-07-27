package com.kh.klib.member.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.GroupSign;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.dao.MemberDAO;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.room.model.vo.RoomSign;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Override
	public Member memberLogin(Member m) {
		return mDAO.memberLogin(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public int dupId(String id) {
		return mDAO.dupId(sqlSession, id);
	}

	@Override
	public int deleteMember(String id) {
		return mDAO.delteMember(sqlSession, id);
	}

	@Override
	public Member mlistcheck(String id) {		
		return mDAO.mlistcheck(sqlSession, id);
	}

	@Override
	public int nickname(String nickname) {
		return mDAO.nickname(sqlSession, nickname);
	}

	@Override
	public int updateMember(Member m) {		
		return mDAO.updateMember(sqlSession, m);		
	}

	@Override
	public void sendEmail(Member member, String div) throws Exception {
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com

		String hostSMTPid = "tjsdk011216@gmail.com"; // 보내는 사람(해당 프로젝트 사용자 본인) 이메일 주소 입력
		String hostSMTPpwd = "ywkk0112!"; // 보내는 사람(해당 프로젝트 사용자 본인) 비밀번호 입력
		
		// 보내는 사람 Email, 제목, 내용
		String fromEmail = "KLIB@naver.com"; // 수신자 이메일에 기록되는 발신자 이메일 주소(없는 이메일인 경우, 전송은 hoswtSMTPid로 이루어짐)
		String fromName = "KLIB"; // 수신자 이메일에 기록되는 발신자 닉네임
		String subject = "";
		String msg = "";

		if(div.equals("findpwd")) {
			subject = "KLIB 임시 비밀번호 발급 안내";
			msg += "<div align='center' style='border:1px solid lightgray; font-family:verdana; padding: 15px;'>";
			msg += "<div style='height: 40px; background: rgb(212, 129, 91)'/>";
			msg += "<h3 style='color: black;'>";
			msg += member.getId() + "님의 임시 비밀번호 입니다.<br> 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<hr>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPwd() + "</p>";
			msg += "<hr>";
			msg += "<b style='color: rgb(212,129, 91);'>KH</b><b>도서관</b></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void findPwd(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Member check = mDAO.mlistcheck(sqlSession, member.getId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(mDAO.dupId(sqlSession, member.getId()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		} // 가입된 아이디에 등록된 이름이 아니면
		else if(!member.getName().equals(check.getName())) {
			out.print("등록된 아이디의 이름과 일치하지 않습니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!member.getEmail().equals(check.getEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			member.setPwd(pwd);
			// 비밀번호 변경
			mDAO.updatePwd(sqlSession, member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpwd");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	@Override
	public int updatePwd(Member member) {
		return mDAO.updatePwd(sqlSession, member);
	}

	@Override
	public ArrayList<RoomSign> selectrList(int no) {
		return mDAO.selectrList(sqlSession, no);
	}

	@Override
	public ArrayList<Board> selectbList(String name) {
		return mDAO.selectbList(sqlSession, name);
	}

	@Override
	public ArrayList<GroupSign> selectgsList(int no) {
		return mDAO.selectgsList(sqlSession, no);
	}

	@Override
	public ArrayList<BookGroup> selectgList() {
		return mDAO.selectgList(sqlSession);
	}

	@Override
	public ArrayList<CultureSign> selectcsList(int no) {
		return mDAO.selectcsList(sqlSession, no);
	}

	@Override
	public ArrayList<Culture> selectcList() {
		return mDAO.selectcList(sqlSession);
	}

	@Override
	public String findId(Member m){
		String id = mDAO.findId(sqlSession, m);
		
		if(id == null) {
			return null;
		} else {
			return id;
		}
	}

}