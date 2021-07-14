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

	public List<ProductVO>  selectAllMypageReviewList(Criteria cri) throws DataAccessException ;
	public int selectMypageReviewCount() throws DataAccessException;
}
