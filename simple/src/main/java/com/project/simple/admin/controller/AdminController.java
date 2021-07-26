package com.project.simple.admin.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.project.simple.page.Criteria;

public interface AdminController {
	
	public ModelAndView listAllInquiry(Criteria cri, HttpServletRequest request, HttpServletResponse response)
			throws Exception;


}
