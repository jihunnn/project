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


import com.project.simple.mypage.dao.MypageDAO;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.page.Criteria;


@Service("mypageService")

public class MypageServiceImpl implements MypageService{
	@Autowired
	MypageDAO mypageDAO;
	
	

	
	//mypage ªÛ«∞ ∏Æ∫‰
	public List<ProductVO> listMypageReview(Criteria cri) throws Exception{
		List<ProductVO> mypageReviewList = mypageDAO.selectAllMypageReviewList(cri);
		return mypageReviewList;
	}
	
	public int mypageReviewCount() throws Exception{
		int mypageReviewCount = mypageDAO.selectMypageReviewCount();
		return mypageReviewCount;
	}
	
	
}	
