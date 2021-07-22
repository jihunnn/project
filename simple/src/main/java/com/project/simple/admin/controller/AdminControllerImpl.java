package com.project.simple.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.simple.admin.service.AdminService;
import com.project.simple.admin.vo.AdminVO;
@Controller("adminController")
public class AdminControllerImpl implements AdminController{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private AdminVO adminVO;
	

	
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
}
