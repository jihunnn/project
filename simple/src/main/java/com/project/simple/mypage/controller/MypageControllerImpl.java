package com.project.simple.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.simple.mypage.service.MypageService;
import com.project.simple.product.vo.ProductVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.PageMaker;
import com.project.simple.page.Criteria;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	
	private static final String ARTICLE_IMAGE_REPO_inquiry = "C:\\spring\\inquiry_image";

	@Autowired
	private MypageService mypageService;
	@Autowired
	private ProductVO productVO;

	@Autowired
	private MemberVO memberVO;

	// 마이페이지 상품리뷰 리스트
	@Override
	@RequestMapping(value = "/mypage_14.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMypageReview(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		productVO.setMemId(memId);

		Map<String, Object> mypageReviewMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		mypageReviewMap.put("memId", memId);
		mypageReviewMap.put("pageStart", pageStart);
		mypageReviewMap.put("perPageNum", perPageNum);
		mypageReviewMap = mypageService.listMypageReview(mypageReviewMap);
		System.out.println(mypageReviewMap);
		int mypageReviewCount = mypageService.mypageReviewCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		mypageReviewMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(mypageReviewCount);
		session.setAttribute("mypageReviewMap", mypageReviewMap);
		session.setAttribute("pageMaker", pageMaker);
		return mav;

	}



}