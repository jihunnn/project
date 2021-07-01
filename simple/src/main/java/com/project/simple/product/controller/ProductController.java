package com.project.simple.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.product.vo.ProductVO;

public interface ProductController {
	public ModelAndView listProduct(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView addProduct(@ModelAttribute("info") ProductVO productVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeProduct(@RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewProduct(@RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception;
}