package com.project.simple.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> listProduct(Map<String, Object> ProductMap) throws Exception;
	public List<ProductVO> admin_listProduct() throws Exception;
	public int addProduct(Map productMap) throws DataAccessException;
	public void removeProduct(String productNum) throws Exception;
	public ProductVO viewProduct(String productNum) throws Exception;
	public ProductVO admin_detailproduct(String productNum) throws Exception;
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<ProductVO> searchProduct(String searchWord) throws Exception;
	public void modProduct(Map productMap) throws Exception;
	public ProductVO productForm(String productNum) throws Exception;
	
	public Map<String, Object> listProductReview(Map<String, Object> productMap) throws Exception;
	public int productReviewCount() throws Exception;


}
