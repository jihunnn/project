package com.project.simple.mypage.dao;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.project.simple.product.vo.ProductVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;


@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//mypage ªÛ«∞ ∏Æ∫‰
	@Override
	public List<ProductVO> selectAllMypageReviewList(Criteria cri) throws DataAccessException {
		List<ProductVO> mypageReviewList = sqlSession.selectList("mapper.product.selectAllMypageReviewList", cri);
		return mypageReviewList;
	}
	
	@Override
	public int selectMypageReviewCount() throws DataAccessException {
		int mypageReviewCount = sqlSession.selectOne("mapper.product.selectMypageReviewCount");

		return mypageReviewCount;
	}
	

}	
