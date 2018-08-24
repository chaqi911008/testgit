package com.chaqi.entity;

/**
 * 系统用户权限实体类
 */
public class Sys_right {
	private Long right_code;//权限编号
	private String right_parent_code;//当前权限的上级编号
	private String right_type;//权限类型
	private String right_text;//权限名称
	private String right_url;//权限访问的路径
	public Long getRight_code() {
		return right_code;
	}
	public void setRight_code(Long right_code) {
		this.right_code = right_code;
	}
	public String getRight_parent_code() {
		return right_parent_code;
	}
	public void setRight_parent_code(String right_parent_code) {
		this.right_parent_code = right_parent_code;
	}
	public String getRight_type() {
		return right_type;
	}
	public void setRight_type(String right_type) {
		this.right_type = right_type;
	}
	public String getRight_text() {
		return right_text;
	}
	public void setRight_text(String right_text) {
		this.right_text = right_text;
	}
	public String getRight_url() {
		return right_url;
	}
	public void setRight_url(String right_url) {
		this.right_url = right_url;
	}
	
}
