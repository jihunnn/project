package com.project.simple.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.mypage.dao.MypageDAO;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.page.Criteria;


@Service("mypageService")

public class MypageServiceImpl implements MypageService{
	@Autowired
	MypageDAO mypageDAO;
	
	

	

	
	//���������� �ֹ���ȸ
	public Map<String ,Object> listMyOrderInfo (Map<String ,Object> myOrderInfoMap) throws Exception{
		List<MypageVO> myOrderInfoList=mypageDAO.selectMyOrderInfoList(myOrderInfoMap);
		myOrderInfoMap.put("myOrderInfoList", myOrderInfoList);
		
		return myOrderInfoMap;
	}
	
	public int myOrderInfoCount(String memId) throws Exception{
		int myOrderInfoCount = mypageDAO.selectMyOrderInfoCount(memId);
		return myOrderInfoCount;
	}
	
	//���������� ����Ȯ��
	@Override
	public void purchaseConfirm(MypageVO mypageVO) throws Exception {
		mypageDAO.updatePurchaseConfirm(mypageVO);	
	}

	
	//mypage ��ǰ ���� ���
	public Map<String ,Object> listMypageReview(Map<String ,Object> mypageReviewMap) throws Exception{
		List<ProductVO> mypageReviewList=mypageDAO.selectMypageReviewList(mypageReviewMap);
		mypageReviewMap.put("mypageReviewList", mypageReviewList);
		return mypageReviewMap;
	}
	
	public int mypageReviewCount(String memId) throws Exception{
		int mypageReviewCount = mypageDAO.selectMypageReviewCount(memId);
		return mypageReviewCount;
	}
	
	//���������� ���� �۾���
	@Override
	public int addNewReview(Map reviewMap) throws Exception{
		return mypageDAO.insertNewReview(reviewMap);
	}
	
	//mypage ��ǰ ���� ���
	@Override
	public Map<String ,Object> listMypageReturn(Map<String ,Object> mypageReturnMap) throws Exception{
		List<MypageVO> mypageReturnList=mypageDAO.selectMypageReturnList(mypageReturnMap);
		mypageReturnMap.put("mypageReturnList", mypageReturnList);
		return mypageReturnMap;
	}
	
	public int mypageReturnCount(String memId) throws Exception{
		int mypageReturnCount = mypageDAO.selectMypageReturnCount(memId);
		return mypageReturnCount;
	}
	
	//���������� ��ǰ �۾���
	@Override
	public void addNewReturn(Map returnMap) throws Exception{
		mypageDAO.insertNewReview(returnMap);
	}
	

	
}	
