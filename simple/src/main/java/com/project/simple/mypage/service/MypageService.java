package com.project.simple.mypage.service;

import java.util.List;
import java.util.Map;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.mypage.vo.MypageVO;

public interface MypageService {


	
	public Map<String ,Object> listMyOrderInfo (Map<String ,Object> myOrderInfoMap) throws Exception;
	public int myOrderInfoCount(String memId) throws Exception;
	public void purchaseConfirm(MypageVO mypageVO) throws Exception;
	
	public Map<String ,Object> listMypageReview(Map<String ,Object> mypageReviewMap) throws Exception;
	public int mypageReviewCount(String memId) throws Exception;
	public int addNewReview(Map reviewMap) throws Exception;
	
	public Map<String ,Object> listMypageReturn(Map<String ,Object> mypageReturnMap) throws Exception;
	public int mypageReturnCount(String memId) throws Exception;
	public void addNewReturn(Map returnMap) throws Exception;

}
