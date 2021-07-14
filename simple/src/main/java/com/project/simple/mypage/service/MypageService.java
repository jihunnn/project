package com.project.simple.mypage.service;

import java.util.List;
import java.util.Map;


import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface MypageService {

	public List<ProductVO> listMypageReview(Criteria cri) throws Exception;
	public int mypageReviewCount() throws Exception;
}
