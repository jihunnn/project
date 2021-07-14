package com.project.simple.mypage.service;

import java.util.List;
import java.util.Map;


import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface MypageService {

	public Map<String ,Object> listMypageReview(Map<String ,Object> mypageReviewMap) throws Exception;
	public int mypageReviewCount(String memId) throws Exception;
}
