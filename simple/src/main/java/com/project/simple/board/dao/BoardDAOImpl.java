package com.project.simple.board.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	//notice게시판
	@Override
	public List<ArticleVO> selectAllNoticeList(Criteria cri) throws DataAccessException {
		List<ArticleVO> noticeList = sqlSession.selectList("mapper.board.selectAllNoticeList", cri);
		return noticeList;
	}
	
	@Override
	public int selectNoticeCount() throws DataAccessException {
		int noticeCount = sqlSession.selectOne("mapper.board.selectNoticeCount");
		System.out.println(noticeCount);
		return noticeCount;
	}
	
	@Override
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNotice", noticeNum);
	}
	
	//question 게시판
	@Override
	public List<ArticleVO> selectAllQuestionList(Criteria cri) throws DataAccessException {
		List<ArticleVO> questionList = sqlSession.selectList("mapper.board.selectAllQuestionList", cri);
		return questionList;
	}

	@Override
	public int selectQuestionCount() throws DataAccessException {
		int questionCount = sqlSession.selectOne("mapper.board.selectQuestionCount");
		return questionCount;
	}
	
	@Override
	public List<ArticleVO> questionSearchList(Map<String ,Object> questionSearchMap) throws DataAccessException {
		List<ArticleVO> questionSearchList =sqlSession.selectList("mapper.board.questionSearchList",questionSearchMap);		
		return questionSearchList;
	}
	
	@Override
	public int questionSeachCount(String search) throws DataAccessException {
		int questionSearchCount = sqlSession.selectOne("mapper.board.questionSearchCount",search);
		return questionSearchCount;
	}
	
	//inquiry 게시판
	@Override
	public List<ArticleVO> selectInquiryList(Map<String ,Object> inquiryMap) throws DataAccessException {
		List<ArticleVO> inquiryList =sqlSession.selectList("mapper.board.selectAllInquiryList",inquiryMap);		

		System.out.println(inquiryList);
		return inquiryList;
	}
	
	@Override
	public int selectInquiryCount(String memId) throws DataAccessException {
		int selectInquiryCount = sqlSession.selectOne("mapper.board.selectInquiryCount",memId);
		return selectInquiryCount;
	}
	
	@Override
	public List<ArticleVO> inquirySearchList(Map<String ,Object> inquirySearchMap) throws DataAccessException {
		System.out.println(inquirySearchMap);
		List<ArticleVO> inquirySearchList =sqlSession.selectList("mapper.board.inquirySearchList",inquirySearchMap);		
		return inquirySearchList;
	}
	
	@Override
	public int inquirySeachCount(Map<String, Object> search) throws DataAccessException {
		int inquirySearchCount = sqlSession.selectOne("mapper.board.inquirySearchCount",search);
		System.out.println(inquirySearchCount);
		return inquirySearchCount;
	}
	
	@Override
	public int insertNewInquiry(Map inquiryMap) throws DataAccessException {
		int inquiryNum = selectNewInquiryNum();
		inquiryMap.put("inquiryNum", inquiryNum);
		sqlSession.insert("mapper.board.insertNewInquiry", inquiryMap);
		return inquiryNum;
	}
	
	private int selectNewInquiryNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewInquiryNum");
		
	}
	
	@Override
	public ArticleVO selectInquiry(int inquiryNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectInquiry", inquiryNum);
	}
	
	
	@Override
	public ArticleVO selectInquiry1(int inquiryNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectInquiry", inquiryNum);
	}
	
	@Override
	public void updateInquiry(Map inquiryMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateInquiry", inquiryMap);
	}
	
	@Override
	public void deleteInquiry(int inquiryNum) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteInquiry", inquiryNum);
	}
}	
