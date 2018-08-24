package com.chaqi.dao;

import com.chaqi.entity.Orders;

import java.util.List;
import java.util.Map;



public interface OrdersDao {
	/*
	 *添加订单
	 */
	public void Orders_Insert(Orders orders);
	
	/*
	 * 模糊查询机会信息
	 */
	public List<Orders> Orders_Select_Mo(Map map);
	
	/*
	 * 模糊查询总条数
	 */
	public Long Orders_SelectCount(Map map);
	
	/*
	 * 修改
	 */
	public void Orders_Update(Orders orders);
	
	/*
	 *按id查询订单信息
	 */
	public Orders selectOrderByid(int id);
	
	/*
	 *删除(不是真正的删除，只是修改状态)
	 */
	public void Order_Delete(Map map);

	
}