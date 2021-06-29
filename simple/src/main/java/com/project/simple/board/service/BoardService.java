package com.project.simple.board.service;

import java.util.List;
import java.util.Map;

import com.project.simple.board.vo.ArticleVO;

public interface BoardService {
	
	public List<ArticleVO> listNotice() throws Exception;
	public ArticleVO viewNotice(int noticeNum) throws Exception;
	public List<ArticleVO> listQuestion() throws Exception;
	public Map<String ,List> listInquiry(ArticleVO articleVO) throws Exception;
	public int addNewInquiry(Map articleMap) throws Exception;
	public ArticleVO viewInquiry(int inquiryNum) throws Exception;
	public ArticleVO inquiryForm(int inquiryNum) throws Exception ;
	
	public void modInquiry(Map inquiryMap) throws Exception ;
}
