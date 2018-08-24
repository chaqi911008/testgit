package com.chaqi.entity;

import java.util.Date;

/**
 * 销售机会实体类
 */
public class Sal_Chance {
	private Long chc_id;//机会编号
	private String chc_source;//机会来源
	private String chc_cust_name;//客户名称
	private String chc_title;//机会概要
	private Integer chc_rate;//成功率
	private String chc_linkman;//联系人
	private String chc_tel;
	
	private String chc_desc;
	private Long chc_create_id; //创建机会编号
	private String chc_create_by; //机会创建人
	private Date chc_create_date; //创建时间
	private Long chc_due_id;  //机会处理编号
	private  String chc_due_to;  //处理人
	private Date chc_due_date;  //处理时间
	private int chc_status;     //0:未开发 1：开发中 2：开发成功 3：开发失败


	public Long getChc_id() {
		return chc_id;
	}

	public void setChc_id(Long chc_id) {
		this.chc_id = chc_id;
	}

	public String getChc_source() {
		return chc_source;
	}

	public void setChc_source(String chc_source) {
		this.chc_source = chc_source;
	}

	public String getChc_cust_name() {
		return chc_cust_name;
	}

	public void setChc_cust_name(String chc_cust_name) {
		this.chc_cust_name = chc_cust_name;
	}

	public String getChc_title() {
		return chc_title;
	}

	public void setChc_title(String chc_title) {
		this.chc_title = chc_title;
	}

	public Integer getChc_rate() {
		return chc_rate;
	}

	public void setChc_rate(Integer chc_rate) {
		this.chc_rate = chc_rate;
	}



	/**
	*联系电话
	*/
	public String getChc_tel() {
		return chc_tel;
	}

	public void setChc_tel(String chc_tel) {
		this.chc_tel = chc_tel;
	}

	/**
	*机会描述
	*/
	public String getChc_desc() {
		return chc_desc;
	}

	public void setChc_desc(String chc_desc) {
		this.chc_desc = chc_desc;
	}

	public Long getChc_create_id() {
		return chc_create_id;
	}

	public void setChc_create_id(Long chc_create_id) {
		this.chc_create_id = chc_create_id;
	}

	public String getChc_create_by() {
		return chc_create_by;
	}

	public void setChc_create_by(String chc_create_by) {
		this.chc_create_by = chc_create_by;
	}



	public Long getChc_due_id() {
		return chc_due_id;
	}

	public void setChc_due_id(Long chc_due_id) {
		this.chc_due_id = chc_due_id;
	}

	public String getChc_due_to() {
		return chc_due_to;
	}

	public void setChc_due_to(String chc_due_to) {
		this.chc_due_to = chc_due_to;
	}



	public int getChc_status() {
		return chc_status;
	}

	public void setChc_status(int chc_status) {
		this.chc_status = chc_status;
	}

	public String getChc_linkman() {
		return chc_linkman;
	}

	public void setChc_linkman(String chc_linkman) {
		this.chc_linkman = chc_linkman;
	}


	public Date getChc_create_date() {
		return chc_create_date;
	}

	public void setChc_create_date(Date chc_create_date) {
		this.chc_create_date = chc_create_date;
	}

	public Date getChc_due_date() {
		return chc_due_date;
	}

	public void setChc_due_date(Date chc_due_date) {
		this.chc_due_date = chc_due_date;
	}
}
