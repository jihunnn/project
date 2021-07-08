package com.project.simple.board.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.board.service.BoardService;
import com.project.simple.board.vo.ImageVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.PageMaker;
import com.project.simple.page.Criteria;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\spring\\inquiry_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;

	@Autowired
	private MemberVO memberVO;

	// 공지사항 리스트
	@Override
	@RequestMapping(value = "board/listNotice.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listNotice(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> noticeList = boardService.listNotice(cri);
		int noticeCount = boardService.noticeCount();
		System.out.println(noticeCount);
		ModelAndView mav = new ModelAndView(viewName);
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(noticeCount);
		mav.addObject("noticeList", noticeList);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	// 공지사항 상세보기
	@RequestMapping(value = "/board/viewNotice.do", method = RequestMethod.GET)
	public ModelAndView viewNotice(@RequestParam("noticeNum") int noticeNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		articleVO = boardService.viewNotice(noticeNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("notice", articleVO);
		return mav;
	}

	// 자주묻는 질문 리스트
	@Override
	@RequestMapping(value = "board/listQuestion.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listQuestion(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> questionList = boardService.listQuestion(cri);
		int questionCount = boardService.questionCount();
		ModelAndView mav = new ModelAndView(viewName);
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(questionCount);
	    int pageNum = pageMaker.getCri().getPage();
		mav.addObject("questionList", questionList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/board/questionSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView questionSearch(@RequestParam("search") String search , Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map<String, Object> questionSearchMap = new HashMap<String,Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		questionSearchMap.put("pageStart", pageStart);
		questionSearchMap.put("perPageNum", perPageNum);
		questionSearchMap.put("search", search);
		questionSearchMap = boardService.questionSearch(questionSearchMap);
		int questionSearchCount = boardService.questionSearchCount(search);
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    int pageNum = pageMaker.getCri().getPage();
	    questionSearchMap.put("pageNum", pageNum);
	    pageMaker.setTotalCount(questionSearchCount);
	    
	    mav.addObject("questionSearchMap", questionSearchMap);
	    mav.addObject("pageMaker", pageMaker);
		mav.addObject("pageNum", pageNum);
		return mav;

	}

	// 1:1문의 리스트
	@Override
	@RequestMapping(value = "/board/listInquiry.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");	
		String memId = memberVO.getmemId();
		articleVO.setmemId(memId);


		Map<String, Object> inquiryMap = new HashMap<String,Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		inquiryMap.put("memId", memId);
		inquiryMap.put("pageStart", pageStart);		
		inquiryMap.put("perPageNum", perPageNum);
		System.out.println(inquiryMap);
		inquiryMap = boardService.listInquiry(inquiryMap);
		int inquiryCount = boardService.inquiryCount(memId);
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    int pageNum = pageMaker.getCri().getPage();
		inquiryMap.put("pageNum", pageNum);
		System.out.println(pageNum);
	    pageMaker.setTotalCount(inquiryCount);
		session.setAttribute("inquiryMap", inquiryMap);
		session.setAttribute("pageMaker", pageMaker);
		return mav;

	}
	
	@Override
	@RequestMapping(value = "/board/inquirySearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inquirySearch(@RequestParam("search1") String search1 , @RequestParam("search2") String search2, Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(search1);
		System.out.println(search2);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		articleVO.setmemId(memId);
		
		Map<String, Object> inquirySearchMap = new HashMap<String,Object>();
		int pageStart = cri.getPageStart();
		int perPageNum = cri.getPerPageNum();
		inquirySearchMap.put("pageStart", pageStart);
		inquirySearchMap.put("perPageNum", perPageNum);
		inquirySearchMap.put("search1", search1);
		inquirySearchMap.put("search2", search2);
		inquirySearchMap.put("memId", memId);
		inquirySearchMap = boardService.inquirySearch(inquirySearchMap);
	    System.out.println(inquirySearchMap);
		int inquirySearchCount = boardService.inquirySearchCount(inquirySearchMap);
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    int pageNum = pageMaker.getCri().getPage();
	    inquirySearchMap.put("pageNum", pageNum);
	    pageMaker.setTotalCount(inquirySearchCount);
	    System.out.println(inquirySearchMap);
	    mav.addObject("inquirySearchMap", inquirySearchMap);
	    session.setAttribute("pageMaker", pageMaker);
	    session.setAttribute("pageNum", pageNum);
	    
		return mav;

	}

	// 1:1문의 글쓰기 폼, A/S 글쓰기 폼
	@RequestMapping(value = "/board/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// 1:1문의 글쓰기
	@Override
	@RequestMapping(value = "/board/addNewInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewInquiry(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> inquiryMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			inquiryMap.put(name, value);
			System.out.println(name);

		}

		String inquiryFile = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		inquiryMap.put("inquiryNum", 0);
		inquiryMap.put("memId", memId);
		inquiryMap.put("inquiryFile", inquiryFile);
		System.out.println(memId);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int inquiryNum = boardService.addNewInquiry(inquiryMap);
			if (inquiryFile != null && inquiryFile.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + inquiryNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/listInquiry.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "  location.href='" + multipartRequest.getContextPath() + "/board/inquiryForm.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String inquiryFile = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			inquiryFile = mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile));// 임시로 저장되 multipartFile을 실제 파일로 전송
																							
				}
			}
		}
		return inquiryFile;

	}

	// 1:1문의 상세보기
	@RequestMapping(value = "/board/viewInquiry.do", method = RequestMethod.GET)
	public ModelAndView viewInquiry(@RequestParam("inquiryNum") int inquiryNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String search1 = request.getParameter("search1");
		String search2 = request.getParameter("search2");
		String pageNum = request.getParameter("pageNum");
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String memId = memberVO.getmemId();
		articleVO.setmemId(memId);
		articleVO = boardService.viewInquiry(inquiryNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		if(search1 != null) {
			mav.addObject("search1",search1);
			mav.addObject("search2",search2);
			mav.addObject("pageNum",pageNum);
		}
		mav.addObject("inquiry", articleVO);
		return mav;
	}

	@RequestMapping(value = "/board/modInquiry.do", method = RequestMethod.POST)
	public ModelAndView inquiryForm(@RequestParam("inquiryNum") int inquiryNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		System.out.println(inquiryNum);
		String viewName = (String) multipartRequest.getAttribute("viewName");
		articleVO = boardService.inquiryForm(inquiryNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("inquiryNum", articleVO);
		System.out.println(articleVO);
		return mav;
	}

	@RequestMapping(value = "/board/modNewInquiry.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modInquiry(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> inquiryMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			inquiryMap.put(name, value);
			System.out.println(name);

		}

		String inquiryFile = upload(multipartRequest);
		inquiryMap.put("inquiryFile", inquiryFile);
		System.out.println(inquiryFile);
		String inquiryNum = (String) inquiryMap.get("inquiryNum");
		inquiryMap.put("inquiryNum", inquiryNum);
		System.out.println(inquiryNum);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {

			boardService.modInquiry(inquiryMap);
			if (inquiryFile != null && inquiryFile.length() != 0) {
				String OrignInquiryFile = (String) inquiryMap.get("OrignInquiryFile");
				System.out.println(OrignInquiryFile);
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + inquiryNum + "\\" + OrignInquiryFile);
				oldFile.delete();

				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + inquiryNum);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

			}
			message = "<script>";
			message += " alert('글을 수정했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewInquiry.do?inquiryNum="
					+ inquiryNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewInquiry.do?inquiryNum="
					+ inquiryNum + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}
	
	//1:1문의 삭제하기
	@Override
	@RequestMapping(value="/board/removeInquiry.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeInquiry(@RequestParam("inquiryNum") int inquiryNum,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
					response.setContentType("text/html; charset-utf-8");
					String message;
					ResponseEntity resEnt = null;
					HttpHeaders responseHeaders = new HttpHeaders();
					responseHeaders.add("Content-Type", "text/html; charset=utf-8");
					try {
						boardService.removeInquiry(inquiryNum);
						File destDir = new File(ARTICLE_IMAGE_REPO+"\\" + inquiryNum);
						FileUtils.deleteDirectory(destDir);
						
						message = "<script>";
						message +=" location.href='"+request.getContextPath() + "/board/listInquiry.do';";
						message +=" </script>";
						resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
							
					} catch(Exception e) {
						message = "<script>";
						message += " alert('오류가 발생했습니다. 다시 수정해주세요);";
						message += " location.href='"+request.getContextPath() + "/board/viewInquiry.do?inquiryNum="+inquiryNum+"';";
						message += " </script>";
						resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
						e.printStackTrace();
					}
					return resEnt;
					
				}



}