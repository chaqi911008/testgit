package com.chaqi.entity;

import java.util.List;

/**
 * 系统用户实体类
 */
public class Sys_user {
	private Long user_id;//用户编号
	private String user_name;//用户姓名
	private String user_password;//用户密码
	private Long user_role_id; //用户角色编号（外键，引用sys_role表）
	private Integer user_flag;//用户标识（标识用户是否有效）
	private Sys_Role sys_role;

	public Long getUser_id() {
		return user_id;
	}
	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public Long getUser_role_id() {
		return user_role_id;
	}
	public void setUser_role_id(Long user_role_id) {
		this.user_role_id = user_role_id;
	}
	public Integer getUser_flag() {
		return user_flag;
	}
	public void setUser_flag(Integer user_flag) {
		this.user_flag = user_flag;
	}


	public Sys_Role getSys_role() {
		return sys_role;
	}

	public void setSys_role(Sys_Role sys_role) {
		this.sys_role = sys_role;
	}
}
