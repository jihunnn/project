package com.project.simple.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.project.simple.page.Criteria;

public interface MypageController {

	public ModelAndView listMypageReview(Criteria cri, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
