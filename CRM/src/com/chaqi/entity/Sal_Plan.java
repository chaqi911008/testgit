package com.chaqi.entity;

import java.util.Date;

/**
 * 销售计划实体类
 */
public class Sal_Plan {
	private Long pla_id;//计划编号
	private Long pla_chc_id;//销售机会编号
	private Date pla_date;//计划日期
	private String pla_todo;//计划目标
	private String pla_result;//结果

	private Sal_Chance sal_chance;
	public Long getPla_id() {
		return pla_id;
	}
	public void setPla_id(Long pla_id) {
		this.pla_id = pla_id;
	}
	public Long getPla_chc_id() {
		return pla_chc_id;
	}
	public void setPla_chc_id(Long pla_chc_id) {
		this.pla_chc_id = pla_chc_id;
	}
	public Date getPla_date() {
		return pla_date;
	}
	public void setPla_date(Date pla_date) {
		this.pla_date = pla_date;
	}
	public String getPla_todo() {
		return pla_todo;
	}
	public void setPla_todo(String pla_todo) {
		this.pla_todo = pla_todo;
	}
	public String getPla_result() {
		return pla_result;
	}
	public void setPla_result(String pla_result) {
		this.pla_result = pla_result;
	}

	public Sal_Chance getSal_chance() {
		return sal_chance;
	}

	public void setSal_chance(Sal_Chance sal_chance) {
		this.sal_chance = sal_chance;
	}
}
