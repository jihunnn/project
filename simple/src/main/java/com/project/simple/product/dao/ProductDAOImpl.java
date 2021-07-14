package com.project.simple.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.board.vo.ArticleVO;
import com.project.simple.page.Criteria;
import com.project.simple.product.vo.ProductVO;

@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectAllProductList(Map<String, Object>ProductMap) throws DataAccessException{
		
		List<ProductVO> productList = sqlSession.selectList("mapper.product.selectAllProductList", ProductMap);
		System.out.println(productList);
		return productList;
	}
	@Override
	public List<ProductVO> admin_selectAllProductList() throws DataAccessException{
		List<ProductVO> productList = sqlSession.selectList("mapper.product.admin_selectAllProductList");
		return productList;
	}
	
	@Override
	public int insertProduct(Map productMap)throws DataAccessException{
		int result=sqlSession.insert("mapper.product.insertProduct", productMap);
		return result;
	}
	
	

	@Override
	public ProductVO selectProduct(String productNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.product.selectProduct", productNum);
	}

	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
		 List<String> list=(ArrayList)sqlSession.selectList("mapper.product.selectKeywordSearch",keyword);
		   return list;
	}

	@Override
	public List<ProductVO> selectProductBySearchWord(String searchWord) throws DataAccessException {
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.product.selectProductBySearchWord",searchWord);
		 return list;
	}
	@Override
	public void deleteProduct(String productNum) throws DataAccessException{
		sqlSession.delete("mapper.product.deleteProduct", productNum);
	}
	@Override
	public void updateProduct(Map productMap) throws DataAccessException {
		sqlSession.update("mapper.product.updateProduct", productMap);
		
	}
	
	@Override
	public List<ProductVO> selectAllProductReviewList(Map<String, Object> productMap) throws DataAccessException {
		List<ProductVO> productReviewList = sqlSession.selectList("mapper.product.selectAllProductReviewList", productMap);
		return productReviewList;
	}
	
	@Override
	public int selectProductReviewCount() throws DataAccessException {
		int productReviewCount = sqlSession.selectOne("mapper.product.selectProductReviewCount");

		return productReviewCount;
	}
	


}
