package com.kh.klib.customer.model.service;

import java.util.ArrayList;

import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.customer.model.vo.Answer;
import com.kh.klib.customer.model.vo.Question;

public interface CustomerService {

	int getListCount();

	ArrayList<Question> getQuestionList(PageInfo pi);

	int insertQuestion(Question question);

	Question getQuestion(int qNo);

	Answer getAnswer(int qNo);

	int insertAnswer(Answer answer);

	int deleteAnswer(int qNo);

	int updateAnswer(Answer answer);

	int deleteQuestion(int qNo);

	int updateQuestion(Question q);

}
