package com.project.simple.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.product.vo.ProductVO;
import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.dao.ProductDAO;


@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService{
	@Autowired
	ProductDAO productDAO;
	
	@Override
	public List<ProductVO> listProduct(Map<String, Object>ProductMap) throws Exception{
		List<ProductVO>  productList = productDAO.selectAllProductList(ProductMap);
		return productList;
	}
	@Override
	public List<ProductVO> admin_listProduct() throws Exception {
		List<ProductVO>  productList = productDAO.admin_selectAllProductList();
		return productList;
	}
	@Override
	public int addProduct(Map productMap) throws DataAccessException {
		return productDAO.insertProduct(productMap);
	}
	@Override
	public void removeProduct(String productNum) throws DataAccessException{
		productDAO.deleteProduct(productNum);
	}
	@Override
	public ProductVO viewProduct(String productNum) throws Exception {
		ProductVO productVO = productDAO.selectProduct(productNum);
		return productVO;
	}
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list=productDAO.selectKeywordSearch(keyword);
		return list;
	}
	@Override
	public List<ProductVO> searchProduct(String searchWord) throws Exception {
		List productList=productDAO.selectProductBySearchWord(searchWord);
		return productList;
	}
	@Override
	public ProductVO admin_detailproduct(String productNum) throws Exception {
		ProductVO productVO = productDAO.selectProduct(productNum);
		return productVO;
	}
	@Override
	public void modProduct(Map productMap) throws Exception  {
		
		productDAO.updateProduct(productMap);

		
	}
	@Override
	public ProductVO productForm(String productNum) throws Exception {
		ProductVO productVO = productDAO.selectProduct(productNum);
		return productVO;
		
	}
	
	public Map<String, Object> listProductReview(Map<String, Object> productMap) throws Exception{
		List<ProductVO> productReviewList = productDAO.selectAllProductReviewList(productMap);
		productMap.put("productReviewList", productReviewList);

		return productMap;
	}
	
	public int productReviewCount() throws Exception{
		int productReviewCount = productDAO.selectProductReviewCount();
		return productReviewCount;
	}
	
	
}
