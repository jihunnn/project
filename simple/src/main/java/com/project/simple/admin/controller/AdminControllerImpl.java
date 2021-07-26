package com.project.simple.admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.simple.admin.service.AdminService;
import com.project.simple.admin.vo.AdminVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;
import com.project.simple.page.PageMaker;

@Controller("adminController")
public class AdminControllerImpl implements AdminController {
	@Autowired
	private AdminService adminService;

	@Autowired
	private AdminVO adminVO;

	@Autowired
	private MemberVO memberVO;

	private ArticleVO articleVO;

	// @Override
	@RequestMapping(value = "/admin/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("admin") AdminVO admin, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		adminVO = adminService.login(admin);
		if (adminVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("admin", adminVO);
			session.setAttribute("AdminisLogOn", true);
			mav.setViewName("redirect:/product/admin_listProduct.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/admin_login.do");
		}
		return mav;
	}

	// 로그아웃 작업
	@RequestMapping(value = "admin/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		session.removeAttribute("AdminisLogOn");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@RequestMapping(value = "/admin_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String admin_login(Model model, HttpSession session) {

		return "admin_login";
	}

	// 회원상세보기
	@RequestMapping(value = "/admin/viewMember.do", method = RequestMethod.POST)
	public ModelAndView viewMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String memId = request.getParameter("memId");
		String viewName = (String) request.getAttribute("viewName");
		memberVO = adminService.viewMember(memId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("member", memberVO);
		return mav;
	}

	// 1:1문의 전체 리스트 가져오기
	@Override
	@RequestMapping(value = "/admin/listAllInquiry.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listAllInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> listAllInquiry = adminService.listAllInquiry(cri);
		int inquiryCount = adminService.inquiryCount();
		ModelAndView mav = new ModelAndView(viewName);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(inquiryCount);
		mav.addObject("inquiryList", listAllInquiry);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	@RequestMapping(value = "/admin/noticeForm.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//공지사항 수정하기
	@RequestMapping(value = "/admin/modNotice.do", method = RequestMethod.POST)
	public ModelAndView inquiryForm(@RequestParam("noticeNum") int noticeNum,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {

		String viewName = (String) multipartRequest.getAttribute("viewName");
		articleVO = adminService.noticeForm(noticeNum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("noticeNum", articleVO);

		return mav;
	}


}
