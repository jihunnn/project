package com.project.simple.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface ProductController {
	public ModelAndView listProduct(@RequestParam("sort") String sort, @RequestParam("subsort") String subsort, HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView admin_listProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity removeProduct(@RequestParam("productNum") String productNum, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView viewProduct(@RequestParam("productNum") String productNum, Criteria cri,HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchProduct(@RequestParam("searchWord") String searchWord,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView admin_detailproduct(@RequestParam("productNum") String productNum,HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ResponseEntity addProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView productForm(@RequestParam("productNum") String productNum,MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;


}
