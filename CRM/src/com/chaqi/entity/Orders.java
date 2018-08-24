package com.chaqi.entity;

import java.util.Date;

/**
 * 订单信息实体类
 */
public class Orders {
	private Long odr_id;//订单编号
	private String odr_customer;//客户名称
	private Date odr_date;//下单日期
	private String odr_type;//订单类型
	private Double odr_cost;//订单总金额
	private Integer odr_status;//订单状态
	public Long getOdr_id() {
		return odr_id;
	}
	public void setOdr_id(Long odr_id) {
		this.odr_id = odr_id;
	}
	public String getOdr_customer() {
		return odr_customer;
	}
	public void setOdr_customer(String odr_customer) {
		this.odr_customer = odr_customer;
	}
	public Date getOdr_date() {
		return odr_date;
	}
	public void setOdr_date(Date odr_date) {
		this.odr_date = odr_date;
	}
	public String getOdr_type() {
		return odr_type;
	}
	public void setOdr_type(String odr_type) {
		this.odr_type = odr_type;
	}
	public Double getOdr_cost() {
		return odr_cost;
	}
	public void setOdr_cost(Double odr_cost) {
		this.odr_cost = odr_cost;
	}

	public Integer getOdr_status() {
		return odr_status;
	}

	public void setOdr_status(Integer odr_status) {
		this.odr_status = odr_status;
	}
}
