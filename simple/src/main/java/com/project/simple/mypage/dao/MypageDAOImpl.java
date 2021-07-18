package com.project.simple.mypage.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.project.simple.product.vo.ProductVO;
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{
	@Autowired
	private SqlSession sqlSession;
	

	
	//상품 주문내역조회
	@Override
	public List<MypageVO> selectMyOrderInfoList(Map<String ,Object> myOrderInfoMap) throws DataAccessException {
		List<MypageVO> myOrderInfoList =sqlSession.selectList("mapper.mypage.selectAllMyOrderInfoList",myOrderInfoMap);		
		
		return myOrderInfoList;
	}
	
	@Override
	public int selectMyOrderInfoCount(String memId) throws DataAccessException {
		int myOrderInfoCount = sqlSession.selectOne("mapper.mypage.selectMyOrderInfoCount",memId);

		return myOrderInfoCount;
	}
	
	@Override
	public void updatePurchaseConfirm(MypageVO mypageVO) throws DataAccessException {
		sqlSession.update("mapper.mypage.updatePurchaseConfirm", mypageVO);
	}
	
	//mypage 상품 리뷰
	@Override
	public List<ProductVO> selectMypageReviewList(Map<String ,Object> mypageReviewMap) throws DataAccessException {
		List<ProductVO> mypageReviewList =sqlSession.selectList("mapper.product.selectAllMypageReviewList",mypageReviewMap);		

		return mypageReviewList;
	}
	
	@Override
	public int selectMypageReviewCount(String memId) throws DataAccessException {
		int mypageReviewCount = sqlSession.selectOne("mapper.product.selectMypageReviewCount",memId);

		return mypageReviewCount;
	}
	
	@Override
	public MypageVO selectReviewWrite(int memOrderSeqNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectReviewWrite", memOrderSeqNum);
	}
	
	@Override
	public int insertNewReview(Map reviewMap) throws DataAccessException {
		int reviewNum = selectNewReviewNum();
		reviewMap.put("reviewNum", reviewNum);
		sqlSession.insert("mapper.mypage.insertNewReview", reviewMap);
		sqlSession.update("mapper.mypage.updateReviewConfirm", reviewMap);
		return reviewNum;
	}
	
	private int selectNewReviewNum() throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectNewReviewNum");
		
	}
	
	@Override
	public MypageVO selectReview(int reviewNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectReview", reviewNum);
	}
	
	
	@Override
	public void updateReview(Map reviewMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateReview", reviewMap);

	}
	
	@Override
	public void deleteReview(Map<String,Object> reviewMap) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteReview", reviewMap);
		sqlSession.update("mapper.mypage.updateReviewOrder", reviewMap);
	}
	
	//마이페이지 반품 리스트
	@Override
	public List<MypageVO> selectMypageReturnList(Map<String ,Object> mypageReturnMap) throws DataAccessException {
		List<MypageVO> mypageReturnList =sqlSession.selectList("mapper.mypage.selectAllMypageReturnList",mypageReturnMap);		
		
		return mypageReturnList;
	}
	
	@Override
	public int selectMypageReturnCount(String memId) throws DataAccessException {
		int mypageReturnCount = sqlSession.selectOne("mapper.mypage.selectMypageReturnCount",memId);

		return mypageReturnCount;
	}
	
	@Override
	public void insertNewReturn(Map returnMap) throws DataAccessException {
		sqlSession.insert("mapper.mypage.insertNewReturn", returnMap);
		sqlSession.update("mapper.mypage.updateReturnConfirm", returnMap);
		
	}
	
	@Override
	public MypageVO selectReturn(int returnNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectReturn", returnNum);
	}
	
	@Override
	public void updateReturn(Map returnMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateReturn", returnMap);
	}
	
	@Override
	public void deleteReturn(Map<String,Object> returnMap) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deleteReturn", returnMap);
		sqlSession.update("mapper.mypage.updateReturnOrder", returnMap);
	}
	


}	
