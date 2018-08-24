package com.chaqi.entity;

import java.util.List;

/**
 * 系统角色实体类
 */
public class Sys_Role {
	private Long role_id;//角色编号
	private String role_name;//角色名称
	private String role_desc;//角色描述
	private Integer role_flag;//角色标识
	private List<Sys_user> userList;
	public Long getRole_id() {
		return role_id;
	}
	public void setRole_id(Long role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_desc() {
		return role_desc;
	}
	public void setRole_desc(String role_desc) {
		this.role_desc = role_desc;
	}
	public Integer getRole_flag() {
		return role_flag;
	}
	public void setRole_flag(Integer role_flag) {
		this.role_flag = role_flag;
	}

	public List<Sys_user> getUserList() {
		return userList;
	}

	public void setUserList(List<Sys_user> userList) {
		this.userList = userList;
	}
}
