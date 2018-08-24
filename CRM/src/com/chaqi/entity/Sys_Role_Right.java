package com.chaqi.entity;

/**
 * 系统角色权限实体类
 */
public class Sys_Role_Right {
	private Long rf_id;//权限编号
	private Long rf_role_id;//角色编号
	private String rf_right_code;//权限编号
	public Long getRf_id() {
		return rf_id;
	}
	public void setRf_id(Long rf_id) {
		this.rf_id = rf_id;
	}
	public Long getRf_role_id() {
		return rf_role_id;
	}
	public void setRf_role_id(Long rf_role_id) {
		this.rf_role_id = rf_role_id;
	}
	public String getRf_right_code() {
		return rf_right_code;
	}
	public void setRf_right_code(String rf_right_code) {
		this.rf_right_code = rf_right_code;
	}
	
}
