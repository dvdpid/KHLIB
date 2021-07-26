package com.kh.klib.customer.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.customer.model.vo.Answer;
import com.kh.klib.customer.model.vo.Question;

@Repository("cuDAO")
public class CustomerDAO {

	public int getListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("customerMapper.getListCount");
	}

	public ArrayList<Question> getQuestionList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("customerMapper.selectQuestionList", null, rowBounds);
	}

	public int insertQuestion(SqlSession sqlSession, Question question) {
		return sqlSession.insert("customerMapper.insertQuestion", question);
	}

	public Question getQuestion(SqlSession sqlSession, int qNo) {
		return sqlSession.selectOne("customerMapper.selectQuestion", qNo);
	}

	public int insertAnswer(SqlSession sqlSession, Answer answer) {
		return sqlSession.insert("customerMapper.insertAnswer", answer);
	}

	public Answer getAnswer(SqlSession sqlSession, int qNo) {
		return sqlSession.selectOne("customerMapper.selectAnswer", qNo);
	}

	public int deleteAnswer(SqlSession sqlSession, int qNo) {
		return sqlSession.update("customerMapper.deleteAnswer", qNo);
	}

	public int updateAnswer(SqlSession sqlSession, Answer answer) {
		return sqlSession.update("customerMapper.updateAnswer", answer);
	}

	public int deleteQuestion(SqlSession sqlSession, int qNo) {
		return sqlSession.update("customerMapper.deleteQuestion", qNo);
	}

	public int updateQuestion(SqlSession sqlSession, Question q) {
		return sqlSession.update("customerMapper.updateQuestion", q);
	}
	
}
