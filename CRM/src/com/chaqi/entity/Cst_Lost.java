package com.chaqi.entity;

import java.util.Date;

/**
 * cst_lost
 */
public class Cst_Lost {
	private Long lst_id;//编号
	private Long lst_cust_no;//客户编号
	private String lst_cust_name;//客户姓名
	private Long lst_cust_manager_id;//客户经理编号
	private String lst_cust_manager_name;//客户经理姓名
	private Date lst_last_order_date;//最后下单时间
	private Date lst_lost_date;//确认流失时间
	private String lst_delay;//暂缓措施
	private String lst_reason;//流失原因
	private String lst_status;//状态|ls,1-警告，2-暂缓流失，3-已经流失
	public Long getLst_id() {
		return lst_id;
	}
	public void setLst_id(Long lst_id) {
		this.lst_id = lst_id;
	}
	public Long getLst_cust_no() {
		return lst_cust_no;
	}
	public void setLst_cust_no(Long lst_cust_no) {
		this.lst_cust_no = lst_cust_no;
	}
	public String getLst_cust_name() {
		return lst_cust_name;
	}
	public void setLst_cust_name(String lst_cust_name) {
		this.lst_cust_name = lst_cust_name;
	}
	public Long getLst_cust_manager_id() {
		return lst_cust_manager_id;
	}
	public void setLst_cust_manager_id(Long lst_cust_manager_id) {
		this.lst_cust_manager_id = lst_cust_manager_id;
	}
	public String getLst_cust_manager_name() {
		return lst_cust_manager_name;
	}
	public void setLst_cust_manager_name(String lst_cust_manager_name) {
		this.lst_cust_manager_name = lst_cust_manager_name;
	}
	public Date getLst_last_order_date() {
		return lst_last_order_date;
	}
	public void setLst_last_order_date(Date lst_last_order_date) {
		this.lst_last_order_date = lst_last_order_date;
	}
	public Date getLst_lost_date() {
		return lst_lost_date;
	}
	public void setLst_lost_date(Date lst_lost_date) {
		this.lst_lost_date = lst_lost_date;
	}
	public String getLst_delay() {
		return lst_delay;
	}
	public void setLst_delay(String lst_delay) {
		this.lst_delay = lst_delay;
	}
	public String getLst_reason() {
		return lst_reason;
	}
	public void setLst_reason(String lst_reason) {
		this.lst_reason = lst_reason;
	}
	public String getLst_status() {
		return lst_status;
	}
	public void setLst_status(String lst_status) {
		this.lst_status = lst_status;
	}
	
}
