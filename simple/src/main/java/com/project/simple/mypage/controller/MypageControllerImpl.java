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
import com.project.simple.mypage.vo.MypageVO;
import com.project.simple.page.PageMaker;
import com.project.simple.page.Criteria;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	
	private static final String ARTICLE_IMAGE_REPO_review = "C:\\spring\\review_image";

	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private ProductVO productVO;
	
	@Autowired
	private MypageVO mypageVO;

	@Autowired
	private MemberVO memberVO;


	
	//마이페이지 주문조회
	@Override
	@RequestMapping(value = "/mypage_04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMyOrderInfo(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		productVO.setMemId(memId);

		Map<String, Object> myOrderInfoMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		myOrderInfoMap.put("memId", memId);
		myOrderInfoMap.put("pageStart", pageStart);
		myOrderInfoMap.put("perPageNum", perPageNum);
		myOrderInfoMap = mypageService.listMyOrderInfo(myOrderInfoMap);
		int myOrderInfoCount = mypageService.mypageReviewCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		myOrderInfoMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(myOrderInfoCount);
		mav.addObject("myOrderInfoMap", myOrderInfoMap);
		mav.addObject("pageMaker", pageMaker);
		System.out.println(myOrderInfoMap);
		return mav;

	}
	
	//주문내역 구매확정
	@RequestMapping(value = "/mypage/purchaseConfirm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity purchaseConfirm(@RequestParam("memOrderSeqNum") int memOrderSeqNum,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message;
		mypageVO.setMemOrderSeqNum(memOrderSeqNum);

		try {
		mypageService.purchaseConfirm(mypageVO);	
		message = "<script>";
		message += " alert('구매확정되었습니다.');";
		message += " location.href='" + request.getContextPath() + "/mypage_04.do';";
		message += " </script>";
		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/mypage_04.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//마이페이지 리뷰 글쓰기 폼
	@RequestMapping(value = "/mypage/reviewWrite.do", method = RequestMethod.GET)
	private ModelAndView reviewWrite(@RequestParam("memOrderSeqNum") int memOrderSeqNum, @RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//상품리뷰 글쓰기 시 기존 memOrderSeqNum과 productNum 세션 해제
		HttpSession session = request.getSession();
		if(session.getAttribute("memOrderSeqNum") != null && session.getAttribute("productNum") !=null) {
		session.removeAttribute("memOrderSeqNum");
		session.removeAttribute("productNum");}

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memName = memberVO.getmemName();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		session.setAttribute("productNum", productNum);
		session.setAttribute("memOrderSeqNum", memOrderSeqNum);
		mav.addObject("memName",memName);
		return mav;
	}
	
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
		int mypageReviewCount = mypageService.mypageReviewCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		mypageReviewMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(mypageReviewCount);
		mav.addObject("mypageReviewMap", mypageReviewMap);
		mav.addObject("pageMaker", pageMaker);
		return mav;

	}
	
	//마이페이지 리뷰 글쓰기
	@Override
	@RequestMapping(value = "/mypage/addNewReview.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			reviewMap.put(name, value);
		}
		


		String reviewFile = uploadReview(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int memOrderSeqNum = (Integer) session.getAttribute("memOrderSeqNum");
		String productNum = (String) session.getAttribute("productNum");
		String memId = memberVO.getmemId();
		
		
		reviewMap.put("reviewNum", 0);
		reviewMap.put("memId", memId);
		reviewMap.put("memOrderSeqNum", memOrderSeqNum);
		reviewMap.put("productNum", productNum);
		reviewMap.put("reviewFile", reviewFile);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int reviewNum = mypageService.addNewReview(reviewMap);
			if (reviewFile != null && reviewFile.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile);
				File destDir = new File(ARTICLE_IMAGE_REPO_review + "\\" + reviewNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/mypage_14.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/mypage/reviewWrite.do?productNum="
					+productNum + "&memOrderSeqNum=" + memOrderSeqNum + "';";

			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String uploadReview(MultipartHttpServletRequest multipartRequest) throws Exception {
		String reviewFile = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();

			MultipartFile mFile = multipartRequest.getFile(fileName);
			reviewFile = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO_review + "\\" + "temp" + "\\" + reviewFile));// 임시로
																													// 저장되
																													// multipartFile을
																													// 실제
																													// 파일로
																													// 전송

				}
			}
		}
		return reviewFile;

	}
	
	@Override
	@RequestMapping(value = "/mypage_07.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listMypageReturn(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		productVO.setMemId(memId);

		Map<String, Object> mypageReturnMap = new HashMap<String, Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		mypageReturnMap.put("memId", memId);
		mypageReturnMap.put("pageStart", pageStart);
		mypageReturnMap.put("perPageNum", perPageNum);
		mypageReturnMap = mypageService.listMypageReview(mypageReturnMap);
		int mypageReturnCount = mypageService.mypageReturnCount(memId);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int pageNum = pageMaker.getCri().getPage();
		mypageReturnMap.put("pageNum", pageNum);
		pageMaker.setTotalCount(mypageReturnCount);
		mav.addObject("mypageReviewMap", mypageReturnMap);
		mav.addObject("pageMaker", pageMaker);
		return mav;

	}
	
/*	@RequestMapping(value = "/mypage/ReturnWrite.do", method = RequestMethod.GET)
	private ModelAndView ReturnWrite(@RequestParam("memOrderSeqNum") int memOrderSeqNum, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//반품 글쓰기 시 기존 memOrderSeqNum세션 해제
		HttpSession session = request.getSession();		
		if(session.getAttribute("memOrderSeqNum") !=null) {
		session.removeAttribute("memOrderSeqNum");}

		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memName = memberVO.getmemName();
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		session.setAttribute("memOrderSeqNum", memOrderSeqNum);
		mav.addObject("memName",memName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/mypage/addNewReturn.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewRetrun(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		request.setCharacterEncoding("utf-8");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = request.getParameter(name);
			returnMap.put(name, value);
		}
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int memOrderSeqNum = (Integer) session.getAttribute("memOrderSeqNum");
		String memId = memberVO.getmemId();
		
		
		returnMap.put("memId", memId);
		returnMap.put("memOrderSeqNum", memOrderSeqNum);


		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			mypageService.addNewReturn(returnMap);
			
			message = "<script>";
			message += " alert('반품신청이 완료되었습니다.');";
			message += "  location.href='" + request.getContextPath() + "/mypage_14.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + request.getContextPath() + "/mypage/reviewWrite.do?memOrderSeqNum="
					 + memOrderSeqNum + "';";

			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
*/



}