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



	
@Controller("boardController")
public class BoardControllerImpl implements BoardController{
		private static final String ARTICLE_IMAGE_REPO = "C:\\spring\\inquiry_image";
		@Autowired
		private BoardService boardService;
		@Autowired
		private ArticleVO articleVO;
		
		@Autowired
		private MemberVO memberVO;
		
		@Override
		@RequestMapping(value="board/listNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView listNotice(HttpServletRequest request,HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			List<ArticleVO> noticeList = boardService.listNotice();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("noticeList", noticeList);
			return mav;
		}
		
		//한개 이미지 보여주기
		@RequestMapping(value="/board/viewNotice.do", method=RequestMethod.GET)
		public ModelAndView viewNotice(@RequestParam("noticeNum") int noticeNum,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			articleVO = boardService.viewNotice(noticeNum);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("notice", articleVO);
			return mav;
		}
		
		@Override
		@RequestMapping(value="board/listQuestion.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView listQuestion(HttpServletRequest request,HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			List<ArticleVO> questionList = boardService.listQuestion();
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("questionList", questionList);
			return mav;
		}
		
		@Override
		@RequestMapping(value="/board/listInquiry.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView listInquiry(HttpServletRequest request,HttpServletResponse response) throws Exception {
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			HttpSession session=request.getSession();
			MemberVO memberVO=(MemberVO)session.getAttribute("member");
			String memId=memberVO.getmemId();
			articleVO.setmemId(memId);
			Map<String ,List> inquiryMap=boardService.listInquiry(articleVO);
			session.setAttribute("inquiryMap", inquiryMap);
			return mav;

	
		}
		
		@RequestMapping(value="/board/*Form.do", method=RequestMethod.GET)			
		private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName =(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			return mav;
		}
		
		//한개 이미지 글쓰기
		@Override
		@RequestMapping(value="/board/addNewInquiry.do", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity addNewInquiry(MultipartHttpServletRequest multipartRequest, 
				HttpServletResponse response) throws Exception {
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> inquiryMap = new HashMap<String, Object>();
			Enumeration enu=multipartRequest.getParameterNames();
			while(enu.hasMoreElements()) {
				String name=(String)enu.nextElement();
				String value=multipartRequest.getParameter(name);
				inquiryMap.put(name, value);
				System.out.println(name);
				
			}
			
			String inquiryFile = upload(multipartRequest);
			HttpSession session =multipartRequest.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			String memId = memberVO.getmemId();
			inquiryMap.put("inquiryNum", 0);
			inquiryMap.put("memId", memId);
			inquiryMap.put("inquiryFile", inquiryFile);
			String message;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
				int inquiryNum = boardService.addNewInquiry(inquiryMap);
				if(inquiryFile != null && inquiryFile.length() !=0) { 
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile);
						File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + inquiryNum);
						FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
				
				message = "<script>";
				message+= " alert('새글을 추가했습니다.');";
				message += "  location.href='" + multipartRequest.getContextPath() + "/board/listInquiry.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);	
				
			}catch(Exception e) {
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile);
					srcFile.delete();
					
				message = "<script>";
				message+= " alert('오류가 발생했습니다. 다시 시도해주세요');";
				message += "  location.href='" + multipartRequest.getContextPath() + "/board/inquiryForm.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
				}
			return resEnt;
		}
		

		private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
			String inquiryFile=null;
			Iterator<String> fileNames = multipartRequest.getFileNames();			
			while(fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				inquiryFile = mFile.getOriginalFilename();
				File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
				if(mFile.getSize()!=0) {	
					if(!file.exists()) {
							file.getParentFile().mkdirs();
							mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + inquiryFile));//임시로 저장되 multipartFile을 실제 파일로 전송
						}
				}
			}
		return inquiryFile;
		
}
		
		//한개 이미지 보여주기
		@RequestMapping(value="/board/viewInquiry.do", method=RequestMethod.GET)
		public ModelAndView viewInquiry(@RequestParam("inquiryNum") int inquiryNum,
							HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			HttpSession session=request.getSession();
			MemberVO memberVO=(MemberVO)session.getAttribute("member");
			String memId=memberVO.getmemId();
			articleVO.setmemId(memId);
			articleVO = boardService.viewInquiry(inquiryNum);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("inquiry", articleVO);
			return mav;
		}
		
		
		@RequestMapping(value="/board/modInquiry.do", method = RequestMethod.POST)			
		public ModelAndView inquiryForm(@RequestParam("inquiryNum") int inquiryNum, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
			System.out.println(inquiryNum);
			String viewName =(String)multipartRequest.getAttribute("viewName");
			articleVO = boardService.inquiryForm(inquiryNum);
			ModelAndView mav = new ModelAndView();
			mav.setViewName(viewName);
			mav.addObject("inquiryNum", articleVO);
			System.out.println(articleVO);
			return mav;
		}
		
		
		  @RequestMapping(value="/board/modNewInquiry.do" ,method = RequestMethod.POST)
		  @ResponseBody
		  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
		    HttpServletResponse response) throws Exception{
		    multipartRequest.setCharacterEncoding("utf-8");
			Map<String,Object> inquiryMap = new HashMap<String, Object>();
			Enumeration enu=multipartRequest.getParameterNames();
			while(enu.hasMoreElements()){
				String name=(String)enu.nextElement();
				String value=multipartRequest.getParameter(name);
				inquiryMap.put(name,value);
				System.out.println(name);
				
			}
			
			String inquiryFile= upload(multipartRequest);
			inquiryMap.put("inquiryFile", inquiryFile);
			System.out.println(inquiryFile);
			String inquiryNum=(String)inquiryMap.get("inquiryNum");
			inquiryMap.put("inquiryNum", inquiryNum);
			System.out.println(inquiryNum);
			String message;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		    try {

		       boardService.modArticle(inquiryMap);
		       if(inquiryFile!=null && inquiryFile.length()!=0) {
			         String OrignInquiryFile = (String)inquiryMap.get("OrignInquiryFile");
			         System.out.println(OrignInquiryFile);
			         File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+inquiryNum+"\\"+OrignInquiryFile);
			         oldFile.delete();
			         
		         File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+inquiryFile);
		         File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+inquiryNum);
		         FileUtils.moveFileToDirectory(srcFile, destDir, true);
		    	   


		       }	
		       message = "<script>";
			   message += " alert('글을 수정했습니다.');";
			   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewInquiry.do?inquiryNum="+inquiryNum+"';";
			   message +=" </script>";
		       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }catch(Exception e) {
		      File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+inquiryFile);
		      srcFile.delete();
		      message = "<script>";
			  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewInquiry.do?inquiryNum="+inquiryNum+"';";
			  message +=" </script>";
		      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }
		    return resEnt;
		  }
		
	



		

}