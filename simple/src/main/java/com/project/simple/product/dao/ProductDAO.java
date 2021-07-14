package com.project.simple.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

public interface ProductDAO {
	public List<ProductVO> selectAllProductList(Map<String, Object> ProductMap) throws DataAccessException;
	public List<ProductVO> admin_selectAllProductList() throws DataAccessException;
	
	public int insertProduct(Map productMap) throws DataAccessException;
	public void deleteProduct(String productNum) throws DataAccessException;
	public ProductVO selectProduct(String productNum) throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public List<ProductVO> selectProductBySearchWord(String searchWord) throws DataAccessException;
	public void updateProduct(Map productMap) throws DataAccessException ;
	
	public List<ProductVO> selectAllProductReviewList(Map<String, Object> productMap) throws DataAccessException;
	public int selectProductReviewCount() throws DataAccessException;
	
}
