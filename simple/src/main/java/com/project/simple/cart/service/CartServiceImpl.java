package com.project.simple.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.simple.cart.dao.CartDAO;
import com.project.simple.cart.vo.CartVO;
import com.project.simple.product.vo.ProductVO;

@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService{


	@Autowired
	private CartDAO cartDAO;
	
	public Map<String ,List> myCartList(CartVO cartVO) throws Exception{
		Map<String,List> cartMap=new HashMap<String,List>();
		List<CartVO> myCartList=cartDAO.selectCartList(cartVO);//��ٱ��Ͽ� ǥ���� ��ٱ��� ���� ��ȸ
		if(myCartList.size()==0){ //īƮ�� ����� ��ǰ�̾��� ���
			return null;
		}
		List<ProductVO> myProductList=cartDAO.selectProductList(myCartList);//��ٱ��� �������� ǥ���� ��ǰ������ ��ȸ
		cartMap.put("myCartList", myCartList);
		cartMap.put("myProductList",myProductList);
		return cartMap; //��ٱ��� ������ ��ǰ ������ cartMap�� �����Ͽ� ��ȯ
	}

	@Override
	public boolean findCartProduct(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);
	}//���̺� �߰��ϱ� ���� ������ ��ǰ ��ȣ�� ������ ��ȸ

	@Override
	public void addProductInCart(CartVO cartVO) throws Exception {
		cartDAO.insertProductInCart(cartVO);
		
	}//��ٱ��� ��ǰ �߰�

	@Override
	public void removeCartProduct(String productNum) throws Exception {
		cartDAO.deleteCartProduct(productNum);
		
	}
}
