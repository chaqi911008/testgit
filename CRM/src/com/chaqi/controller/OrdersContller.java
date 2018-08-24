package com.chaqi.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;


import com.chaqi.entity.Orders;
import com.chaqi.service.impl.OrdersServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrdersContller {
	@Autowired
	private OrdersServiceImpl ordersService;

	/**
	 * 进入到订单查询页面
	 * @param pageNow         当前页码
	 * @param pageSize         每页显示的条数
	 * @param odr_customer     客户名称
	 * @param odr_type          订单类型
	 * @param req
	 * @return
	 */
	@RequestMapping("/orderShow")
	public String select(String pageNow,String pageSize, String odr_customer, String odr_type, HttpServletRequest req) {
		Page<Orders> ordersPage = ordersService.Orders_Select_Mo(pageNow, pageSize, odr_customer, odr_type);
		req.setAttribute("ordersPage",ordersPage);
		req.setAttribute("odr_customer",odr_customer);
		req.setAttribute("odr_type",odr_type);
		return "orders";
	}

	/**
	 * 进入到添加订单页面
	 * @return
	 */
	@RequestMapping("/orderinsert")
	public String insert() {
		return "ordersinsert";
	}

	/**
	 * 添加订单
	 * @param odr_customer   客户名称
	 * @param odr_date       下单日期
	 * @param odr_type       订单类型
	 * @param odr_cost       总金额
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/ordersadd")
	public String chancemanageinsert( String odr_customer, String odr_date, 
		String odr_type, Double odr_cost)
					throws ParseException {
		
		Orders order =  new Orders();
		order.setOdr_customer(odr_customer);
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		order.setOdr_date(s.parse(odr_date));
		order.setOdr_type(odr_type);
		order.setOdr_cost(odr_cost);
		order.setOdr_status(1);
		ordersService.Orders_Insert(order);
		return "redirect:orderShow";
		}

	/**
	 * 进入到查看订单详情页面
	 * @param mo
	 * @param id   订单编号
	 * @return
	 */
	@RequestMapping("/orderchakan")
	public String orderchakan(Model mo, int id) {
		Orders orders = ordersService.selectOrderByid(id);
		mo.addAttribute("orders", orders);
		return "orderchakan";
	}

	/**
	 * 进入到修改订单页面
	 * @param mo
	 * @param id   订单编号
	 * @return
	 */
	@RequestMapping("/orderupdatechaxun")
	public String orderupdatechaxun(Model mo, int id) {
		Orders orders = ordersService.selectOrderByid(id);
		mo.addAttribute("orders", orders);
		return "ordersassign";
	}

	/**
	 * 修改订单信息
	 * @param odr_id          订单编号
	 * @param odr_customer    客户名称
	 * @param odr_date        下单日期
	 * @param odr_type        订单类型
	 * @param odr_cost        总金额
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("/ordersupdate")
	public String ordersupdate(Long odr_id, String odr_customer, String odr_date, 
		String odr_type, Double odr_cost)
					throws ParseException {
		
		Orders order =  new Orders();
		order.setOdr_id(odr_id);
		order.setOdr_customer(odr_customer);
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		order.setOdr_date(s.parse(odr_date));
		order.setOdr_type(odr_type);
		order.setOdr_cost(odr_cost);
		ordersService.Orders_Update(order);
		return "redirect:orderShow";
		}

	/**
	 * 删除订单（不是真正的删除，只是修改状态）
	 * @param mo
	 * @param id              订单编号
	 * @param odr_status     订单状态
	 * @return
	 */
	@RequestMapping("/orderdelete")
	public String orderdelete(Model mo, Long id,int odr_status) {
		Map map=new HashMap();
		map.put("odr_id",id);
		map.put("odr_status",odr_status);
		ordersService.Order_Delete(map);
		return "redirect:orderShow";
	}
}
