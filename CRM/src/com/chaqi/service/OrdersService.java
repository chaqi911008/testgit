package com.chaqi.service;

import com.chaqi.entity.Orders;
import com.chaqi.utils.Page;

import java.util.List;
import java.util.Map;


public interface OrdersService {
	/*
	 *添加订单
	 */
	public void Orders_Insert(Orders orders);
	
	/*
	 * 模糊查询机会信息
	 */
	public Page<Orders> Orders_Select_Mo(String now, String size, String odr_customer, String odr_type);
	
	/*
	 * 修改
	 */
	public void Orders_Update(Orders orders);

	/*
	 *按id查询订单信息
	 */
	public Orders selectOrderByid(int id);
	
	/*
	 *删除
	 */
	public void Order_Delete(Map map);

	
}
