package com.chaqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.chaqi.dao.OrdersDao;
import com.chaqi.entity.Orders;
import com.chaqi.service.OrdersService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersServiceImpl implements OrdersService {
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public Page<Orders> Orders_Select_Mo(String now,String size, String odr_customer, String odr_type) {
		Page<Orders> page=new Page<Orders>();
		Long pageNow=1L;
		if(now!=null){
			pageNow=Long.parseLong(now);
		}
		page.setPageNow(pageNow);
		Long pageSize= ConstSystem.PAGE_SIZE;
		if(size!=null){
			pageSize=Long.parseLong(size);
		}
		page.setPageSize(pageSize);
		Map map=new HashMap();
		map.put("pageNow",pageNow);
		map.put("pageSize",pageSize);
		map.put("odr_customer",odr_customer);
		map.put("odr_type",odr_type);
		Long count = ordersDao.Orders_SelectCount(map);
		page.setCount(count);
		Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
		page.setPageCount(pageCount);
		List<Orders> list = ordersDao.Orders_Select_Mo(map);
		page.setList(list);
		return page;
	}

	@Override
	public void Orders_Insert(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.Orders_Insert(orders);
	}

	@Override
	public void Orders_Update(Orders orders) {
		// TODO Auto-generated method stub
		ordersDao.Orders_Update(orders);

	}

	@Override
	public Orders selectOrderByid(int id) {
		// TODO Auto-generated method stub
		return ordersDao.selectOrderByid(id);
	}

	@Override
	public void Order_Delete(Map map) {
		// TODO Auto-generated method stub
		ordersDao.Order_Delete(map);
	}

}
