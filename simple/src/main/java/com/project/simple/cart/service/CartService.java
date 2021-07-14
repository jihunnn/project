package com.project.simple.cart.service;

import java.util.List;
import java.util.Map;

import com.project.simple.cart.vo.CartVO;

public interface CartService {

	public Map<String ,List> myCartList(CartVO cartVO) throws Exception;

	public boolean findCartProduct(CartVO cartVO) throws Exception;

	public void addProductInCart(CartVO cartVO)throws Exception;

	public void removeCartProduct(String productNum)throws Exception;
}
