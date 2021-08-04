package com.project.simple.errorcontroller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice
public class ExceptionController {
	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handleError404(HttpServletRequest request, Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("404");
		mav.addObject("message", "404����");
		mav.addObject("url", request.getRequestURL());
		return mav;
	}
	
	/* common �޼ҵ�� Exception Ÿ������ ó���ϴ� ��� ���ܸ� ó���ϵ��� ����*/
	@ExceptionHandler(Exception.class)
	public ModelAndView common(Exception e, HttpServletRequest request) {
		logger.info(e.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("500");
		mav.addObject("exception", e);  //���ܸ� �信 �ѱ�ϴ�.
		mav.addObject("url", request.getRequestURL());
		return mav;
	}
}
	

