package com.chaqi.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.chaqi.dao.OrdersDao;
import com.chaqi.entity.Orders;
import com.chaqi.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class OrdersImpl implements OrdersDao {
	@Autowired
	private OrderMapper orderMapper;

	public OrderMapper getOrderMapper() {
		return orderMapper;
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	@Override
	public void Orders_Insert(Orders orders) {
		// TODO Auto-generated method stub
		orderMapper.Orders_Insert(orders);
	}

	@Override
	public List<Orders> Orders_Select_Mo(Map map) {

		return orderMapper.Orders_Select_Mo(map);
	}

	@Override
	public Long Orders_SelectCount(Map map) {

		return orderMapper.Orders_SelectCount(map);
	}

	@Override
	public void Orders_Update(Orders orders) {
		// TODO Auto-generated method stub
		orderMapper.Orders_Update(orders);
		
	}

	@Override
	public Orders selectOrderByid(int id) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderByid(id);
	}

	@Override
	public void Order_Delete(Map map) {
		// TODO Auto-generated method stub
		orderMapper.Order_Delete(map);
		
	}
	
	
	

}
