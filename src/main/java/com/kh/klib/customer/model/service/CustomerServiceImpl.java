package com.kh.klib.customer.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.customer.model.dao.CustomerDAO;
import com.kh.klib.customer.model.vo.Answer;
import com.kh.klib.customer.model.vo.Question;

@Service("cuService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private CustomerDAO cDAO;
	
	@Override
	public int getListCount() {
		return cDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Question> getQuestionList(PageInfo pi) {
		return cDAO.getQuestionList(sqlSession, pi);
	}

	@Override
	public int insertQuestion(Question question) {
		return cDAO.insertQuestion(sqlSession, question);
	}

	@Override
	public Question getQuestion(int qNo) {
		return cDAO.getQuestion(sqlSession, qNo);
	}

	@Override
	public int insertAnswer(Answer answer) {
		return cDAO.insertAnswer(sqlSession, answer);
	}
	
	@Override
	public Answer getAnswer(int qNo) {
		return cDAO.getAnswer(sqlSession, qNo);
	}

	@Override
	public int deleteAnswer(int qNo) {
		return cDAO.deleteAnswer(sqlSession, qNo);
	}

	@Override
	public int updateAnswer(Answer answer) {
		return cDAO.updateAnswer(sqlSession, answer);
	}

	@Override
	public int deleteQuestion(int qNo) {
		return cDAO.deleteQuestion(sqlSession, qNo);	
	}

	@Override
	public int updateQuestion(Question q) {
		return cDAO.updateQuestion(sqlSession, q);
	}


}
