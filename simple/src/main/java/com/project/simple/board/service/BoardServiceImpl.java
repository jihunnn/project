package com.project.simple.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.project.simple.board.dao.BoardDAO;
import com.project.simple.board.vo.ArticleVO;


@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)

public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	//notice 게시판
	public List<ArticleVO> listNotice() throws Exception{
		List<ArticleVO> noticeList = boardDAO.selectAllNoticeList();
		return noticeList;
	}
	
	//단일 파일 보이기
	@Override
	public ArticleVO viewNotice(int noticeNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectNotice(noticeNum);
		return articleVO;
	}
	//qustion 게시판
	public List<ArticleVO> listQuestion() throws Exception{
		List<ArticleVO> questionList = boardDAO.selectAllQuestionList();
		return questionList;
	}
	
	//inquiry 게시판
	public Map<String ,List> listInquiry(ArticleVO articleVO) throws Exception{
		Map<String,List> inquiryMap=new HashMap<String,List>();
		List<ArticleVO> inquiryList=boardDAO.selectInquiryList(articleVO);
		if(inquiryList.size()==0){ //카트에 저장된 상품이없는 경우
			return null;
		}
		inquiryMap.put("inquiryList", inquiryList);
		return inquiryMap;
	}
	
	
	@Override
	public int addNewInquiry(Map inquiryMap) throws Exception{
		return boardDAO.insertNewInquiry(inquiryMap);
	}
	
	@Override
	public ArticleVO viewInquiry(int inquiryNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectInquiry(inquiryNum);
		return articleVO;
	}
	

	
	@Override
	public ArticleVO inquiryForm(int inquiryNum) throws Exception {
		ArticleVO articleVO = boardDAO.selectInquiry1(inquiryNum);
		return articleVO;
	}
	
	@Override
	public void modInquiry(Map inquiryMap) throws Exception {
		boardDAO.updateInquiry(inquiryMap);
	}

	
}	
