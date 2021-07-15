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
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//mypage ªÛ«∞ ∏Æ∫‰
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
	public List<MypageVO> selectMyOrderInfoList(Map<String ,Object> myOrderInfoMap) throws DataAccessException {
		List<MypageVO> myOrderInfoList =sqlSession.selectList("mapper.mypage.selectAllMyOrderInfoList",myOrderInfoMap);		
		
		return myOrderInfoList;
	}
	
	@Override
	public int selectMyOrderInfoCount(String memId) throws DataAccessException {
		int myOrderInfoCount = sqlSession.selectOne("mapper.mypage.selectMyOrderInfoCount",memId);

		return myOrderInfoCount;
	}
	

}	
