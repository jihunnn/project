package com.project.simple.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.project.simple.page.Criteria;

public interface BoardController {
	
	public ModelAndView listNotice(Criteria cri,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewNotice(@RequestParam("noticeNum") int noticeNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listQuestion(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listInquiry( HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewInquiry(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewInquiry(@RequestParam("inquiryNum") int inquiryNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView inquiryForm(@RequestParam("inquiryNum") int inquiryNum, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public ResponseEntity removeInquiry(@RequestParam("inquiryNum") int inquiryNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
