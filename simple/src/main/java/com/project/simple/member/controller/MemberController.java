package com.project.simple.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.simple.member.vo.MemberVO;
import com.project.simple.page.Criteria;

public interface MemberController{
	public ModelAndView listMembers(Criteria cri,HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView addMember(@ModelAttribute("info")
	MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember_naver(@ModelAttribute("info")
	MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@ModelAttribute("removemember")
	MemberVO removemember, HttpServletRequest request, HttpServletResponse response,RedirectAttributes rAttr) throws Exception;
	public ModelAndView modMember(@ModelAttribute("modmember")
	MemberVO modmember,HttpServletRequest request, HttpServletResponse response,RedirectAttributes rAttr) throws Exception;
	public ModelAndView memberSearch(@RequestParam("search") String search, @RequestParam("searchType") String searchType, Criteria cri, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("memId") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;

	
}