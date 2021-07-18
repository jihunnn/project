package com.project.simple.mypage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.dao.DataAccessException;

import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface MypageDAO {


	
	public List<MypageVO> selectMyOrderInfoList(Map<String ,Object> myOrderInfoMap) throws DataAccessException ;
	public int selectMyOrderInfoCount(String memId) throws DataAccessException;
	public void updatePurchaseConfirm(MypageVO mypageVO) throws DataAccessException;
	
	public List<ProductVO> selectMypageReviewList(Map<String ,Object> mypageReviewMap) throws DataAccessException;
	public int selectMypageReviewCount(String memId) throws DataAccessException;
	public MypageVO selectReviewWrite(int memOrderSeqNum) throws DataAccessException ;
	public int insertNewReview(Map reviewMap) throws DataAccessException;
	public MypageVO selectReview(int reviewNum) throws DataAccessException;
	public void updateReview(Map reviewMap) throws DataAccessException;
	public void deleteReview(Map<String,Object> reviewMap) throws DataAccessException;
	
	public List<MypageVO> selectMypageReturnList(Map<String ,Object> mypageReturnMap) throws DataAccessException;
	public int selectMypageReturnCount(String memId) throws DataAccessException ;
	public void insertNewReturn(Map returnMap) throws DataAccessException ;
	public MypageVO selectReturn(int returnNum) throws DataAccessException ;
	public void updateReturn(Map returnMap) throws DataAccessException ;
	public void deleteReturn(Map<String,Object> returnMap) throws DataAccessException ;
	
}
