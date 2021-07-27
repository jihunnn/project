package com.project.simple.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;


import com.project.simple.cart.vo.CartVO;
import com.project.simple.order.dao.OrderDAO;
import com.project.simple.order.vo.OrderVO;


@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception{
		List<OrderVO> orderGoodsList;
		orderGoodsList=orderDAO.listMyOrderGoods(orderVO);
		return orderGoodsList;
	}
	
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception{
		orderDAO.insertNewOrder(myOrderList);
		//카트에서 주문 상품 제거한다.
		orderDAO.removeGoodsFromCart(myOrderList);
	}	
	
	public OrderVO selectcartlist(String memCartId) throws Exception {
		return orderDAO.selectcartlist(memCartId);
	}
	
	public OrderVO findMyOrder(String order_id) throws Exception{
		return orderDAO.findMyOrder(order_id);
	}
	
	//회원 주문하기
	@Override
	public void addNewOrder1(OrderVO order) throws Exception{
		orderDAO.insertNewOrder1(order);
	}
	

}
	

