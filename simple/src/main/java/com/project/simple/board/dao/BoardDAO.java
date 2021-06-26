package com.project.simple.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.board.vo.ArticleVO;


public interface BoardDAO{
	public List selectAllNoticeList() throws DataAccessException;
	
	public ArticleVO selectNotice(int noticeNum) throws DataAccessException;
	
	public List selectAllQuestionList() throws DataAccessException;
	
	public List selectAllInquiryList(String memId) throws DataAccessException;

}