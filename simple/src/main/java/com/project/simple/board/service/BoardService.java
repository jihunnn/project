package com.project.simple.board.service;

import java.util.List;
import java.util.Map;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;

public interface BoardService {
	
	public List<ArticleVO> listNotice(Criteria cri) throws Exception;
	public int noticeCount() throws Exception;
	public ArticleVO viewNotice(int noticeNum) throws Exception;
	public List<ArticleVO> listQuestion(Criteria cri) throws Exception;
	public int questionCount() throws Exception;
	public Map<String ,List> listInquiry(ArticleVO articleVO) throws Exception;
	public int addNewInquiry(Map articleMap) throws Exception;
	public ArticleVO viewInquiry(int inquiryNum) throws Exception;
	public ArticleVO inquiryForm(int inquiryNum) throws Exception ;
	
	public void modInquiry(Map inquiryMap) throws Exception ;
	public void removeInquiry(int inquiryNum) throws Exception;
}
