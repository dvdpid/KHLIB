package com.kh.klib.customer.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.klib.common.Pagination;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.customer.exception.CustomerException;
import com.kh.klib.customer.model.service.CustomerService;
import com.kh.klib.customer.model.vo.Answer;
import com.kh.klib.customer.model.vo.Question;
import com.kh.klib.member.model.vo.Member;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService cuService;

	@RequestMapping("customer.cm")
	public String CustomerMain() {
		return "customerFAQ";
	}

	@RequestMapping("insertQuestion.cm")
	public String QuestionInsert(@ModelAttribute Question question, @SessionAttribute("loginUser") Member m)
			throws CustomerException {

		int result = 0;
		if (m != null) {
			question.setWriter(m.getNickname());
			question.setUserNo(m.getNo());
			result = cuService.insertQuestion(question);
		} else {
			return "redirect:loginForm.me";
		}

		if (result > 0) {
			return "redirect:detail.cm?qNo=" + question.getqNo();
		} else {
			throw new CustomerException("질문글 작성에 실패하였습니다.");
		}

	}

	@RequestMapping("qna.cm")
	public String CustomerService(@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "content", required = false) String content, Model model) {

		int listCount = cuService.getListCount();

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Question> qList = cuService.getQuestionList(pi);

		model.addAttribute("pi", pi);

		if (qList != null) {
			model.addAttribute("qList", qList);
		}

		return "customerService";
	}

	@RequestMapping("questionForm.cm")
	public String CustomerQuestion() {
		return "questionForm";
	}

	@RequestMapping(value="insertAnswer.cm")
	public String CustomerInsertAnswer(@ModelAttribute Answer answer, 
									   @SessionAttribute("loginUser") Member m,
									   HttpServletResponse response) {
//		작성자 정보 입력
		answer.setWriter(m.getNickname());
		answer.setUserNo(m.getNo());
//		답변 삽입
		if (m.getAdmin().equals("Y")) {
			cuService.insertAnswer(answer);
		}

		return "redirect:detail.cm?qNo=" + answer.getqNo();
	}

	@RequestMapping("detail.cm")
	public String CustomerDetail(@RequestParam("qNo") int qNo, Model model) throws CustomerException {

		Question q = cuService.getQuestion(qNo);

		Answer a = cuService.getAnswer(qNo);
		if (q != null) {
			model.addAttribute("a", a);
			model.addAttribute("q", q);
		}

		return "questionDetail";
	}

	@RequestMapping(value = "getAnswer.cm", produces = "application/json; charset=utf-8")
	public void CustomerGetAnswer(@RequestParam("qNo") int qNo, HttpServletResponse response)
			throws JsonIOException, IOException {
		Answer answer = cuService.getAnswer(qNo);

		Gson gson = new Gson();

		response.setCharacterEncoding("utf-8");

		gson.toJson(answer, response.getWriter());
	}

	@RequestMapping(value = "delete.cm")
	public String CustomerDelete(@RequestParam("qNo") int qNo, @SessionAttribute("loginUser") Member m) {
		if (m.getAdmin().equals("Y")) {
			cuService.deleteAnswer(qNo);
		}

		return "redirect:detail.cm?qNo=" + qNo;
	}

	@RequestMapping(value = "updateAnswer.cm")
	public String CustomerUpdateForm(@RequestParam("qNo") int qNo, @SessionAttribute("loginUser") Member m,
			HttpServletRequest request, Model model) {

		Answer a = cuService.getAnswer(qNo);
		Question q = cuService.getQuestion(qNo);

		if (a != null && m.getAdmin().equals("Y")) {
			model.addAttribute("q", q);
			model.addAttribute("a", a);
			return "answerUpdate";
		}

		return "redirect:detail.cm?qNo=" + qNo;
	}

	@RequestMapping(value = "update.cm")
	public String CustomerUpdate(@ModelAttribute Answer answer, @SessionAttribute("loginUser") Member m) {
		if (m.getAdmin().equals("Y")) {
			cuService.updateAnswer(answer);
		}

		return "redirect:detail.cm?qNo=" + answer.getqNo();
	}
	
	@RequestMapping(value="updateQuestionForm.cm")
	public String CustomerQuestionUpdateForm(@RequestParam("qNo") int qNo, @SessionAttribute("loginUser") Member m, Model model) {
		Question q = cuService.getQuestion(qNo);
		if(m.getNo() == q.getUserNo()) {
			model.addAttribute("q", q);
			
			return "questionUpdateForm";
		}
		
		return "redirect:qna.cm";
		
	}
	
	@RequestMapping(value="deleteQuestion.cm")
	public String CustomerDeleteQuestion(@RequestParam("qNo") int qNo, @SessionAttribute("loginUser") Member m) {
		Question q = cuService.getQuestion(qNo);
		if(m.getNo() == q.getUserNo()) {
			cuService.deleteQuestion(qNo);
		}
		
		return "redirect:qna.cm";
	}
	
	@RequestMapping(value="updateQuestion.cm")
	public String CustomerQuestionUpdate(@ModelAttribute Question q, @SessionAttribute("loginUser") Member m) {
		Question originalQuestion = cuService.getQuestion(q.getqNo());
		if(m.getNo() == originalQuestion.getUserNo()) {
			cuService.updateQuestion(q);
			return "redirect:detail.cm?qNo="+q.getqNo();
		}
		
		return "redirect:qna.cm";
		
	}

}
