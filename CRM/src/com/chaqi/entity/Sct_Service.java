package com.chaqi.entity;

import java.util.Date;

/**
 * 客户服务实体类
 */
public class Sct_Service {
	private Long svr_id;//编号
	private String svr_type;//服务类型
	private String svr_title;//概要
	private String svr_cust_name;//客户名称
	private String svr_request;//服务请求
	private Long svr_create_id;//创建人编号
	private String svr_create_by;//创建人名称
	private Date svr_create_date;//创建时间
	private Long svr_due_id;//分配给的员工编号
	private String svr_due_to;//分配给的员工姓名
	private Date svr_due_date;//分配时间
	private String svr_deal;//服务处理
	private Long svr_deal_id;//处理人编号
	private String svr_deal_by;//处理人姓名
	private Date svr_deal_date;//处理日期
	private String svr_result;//结果
	private Integer svr_satisfy;//满意度
	public Long getSvr_id() {
		return svr_id;
	}
	public void setSvr_id(Long svr_id) {
		this.svr_id = svr_id;
	}
	public String getSvr_type() {
		return svr_type;
	}
	public void setSvr_type(String svr_type) {
		this.svr_type = svr_type;
	}
	public String getSvr_title() {
		return svr_title;
	}
	public void setSvr_title(String svr_title) {
		this.svr_title = svr_title;
	}
	public String getSvr_cust_name() {
		return svr_cust_name;
	}
	public void setSvr_cust_name(String svr_cust_name) {
		this.svr_cust_name = svr_cust_name;
	}
	public String getSvr_request() {
		return svr_request;
	}
	public void setSvr_request(String svr_request) {
		this.svr_request = svr_request;
	}
	public Long getSvr_create_id() {
		return svr_create_id;
	}
	public void setSvr_create_id(Long svr_create_id) {
		this.svr_create_id = svr_create_id;
	}
	public String getSvr_create_by() {
		return svr_create_by;
	}
	public void setSvr_create_by(String svr_create_by) {
		this.svr_create_by = svr_create_by;
	}
	public Date getSvr_create_date() {
		return svr_create_date;
	}
	public void setSvr_create_date(Date svr_create_date) {
		this.svr_create_date = svr_create_date;
	}
	public Long getSvr_due_id() {
		return svr_due_id;
	}
	public void setSvr_due_id(Long svr_due_id) {
		this.svr_due_id = svr_due_id;
	}
	public String getSvr_due_to() {
		return svr_due_to;
	}
	public void setSvr_due_to(String svr_due_to) {
		this.svr_due_to = svr_due_to;
	}
	public Date getSvr_due_date() {
		return svr_due_date;
	}
	public void setSvr_due_date(Date svr_due_date) {
		this.svr_due_date = svr_due_date;
	}
	public String getSvr_deal() {
		return svr_deal;
	}
	public void setSvr_deal(String svr_deal) {
		this.svr_deal = svr_deal;
	}
	public Long getSvr_deal_id() {
		return svr_deal_id;
	}
	public void setSvr_deal_id(Long svr_deal_id) {
		this.svr_deal_id = svr_deal_id;
	}
	public String getSvr_deal_by() {
		return svr_deal_by;
	}
	public void setSvr_deal_by(String svr_deal_by) {
		this.svr_deal_by = svr_deal_by;
	}
	public Date getSvr_deal_date() {
		return svr_deal_date;
	}
	public void setSvr_deal_date(Date svr_deal_date) {
		this.svr_deal_date = svr_deal_date;
	}
	public String getSvr_result() {
		return svr_result;
	}
	public void setSvr_result(String svr_result) {
		this.svr_result = svr_result;
	}
	public Integer getSvr_satisfy() {
		return svr_satisfy;
	}
	public void setSvr_satisfy(Integer svr_satisfy) {
		this.svr_satisfy = svr_satisfy;
	}

}	
