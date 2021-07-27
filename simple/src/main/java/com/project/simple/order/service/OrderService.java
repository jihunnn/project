package com.project.simple.order.service;

import java.util.List;
import java.util.Map;


import com.project.simple.cart.vo.CartVO;
import com.project.simple.order.vo.OrderVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;
	public OrderVO selectcartlist(String memCartId) throws Exception;
	public void addNewOrder1(OrderVO order) throws Exception;

	
	
}
