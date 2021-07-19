package com.project.simple.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.project.simple.cart.vo.CartVO;
import com.project.simple.product.vo.ProductVO;

@Repository("cartDAO")
public class CartDAOImpl implements  CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList =(List)sqlSession.selectList("mapper.cart.selectCartList",cartVO);
		return cartList;
	}

	@Override
	public List<ProductVO> selectProductList(List<CartVO> cartList) throws DataAccessException {
		List<ProductVO> myProductList;
		myProductList = sqlSession.selectList("mapper.cart.selectProductList",cartList);
		return myProductList;
	}

	@Override
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result=sqlSession.selectOne("mapper.cart.selectCountInCart",cartVO);
		return Boolean.parseBoolean(result);
	}//이미 장바구니 추가된 상품인지 조회

	@Override
	public void insertProductInCart(CartVO cartVO) throws DataAccessException {
		int memCartId = selectMaxCartId();
		cartVO.setmemCartId(memCartId);
		sqlSession.insert("mapper.cart.insertProductInCart",cartVO);
		
	}//장바구니에 추가

	private int selectMaxCartId() throws DataAccessException{
		int memCartId = sqlSession.selectOne("mapper.cart.selectMaxCartId");
		return memCartId;
	}

	@Override
	public void deleteCartProduct(String productNum) throws DataAccessException {
		sqlSession.delete("mapper.cart.deleteCartProduct",productNum);
		
	}

}
