package com.chaqi.entity;
/**
 * 数据字典实体类
 */
public class Bas_Dict {
	private Long dict_id;//编号
	private String dict_type;//类别
	private String dict_item;//条目
	private Long dict_value;//值
	private Integer dict_is_editable;//是否可编辑
	public Long getDict_id() {
		return dict_id;
	}
	public void setDict_id(Long dict_id) {
		this.dict_id = dict_id;
	}
	public String getDict_type() {
		return dict_type;
	}
	public void setDict_type(String dict_type) {
		this.dict_type = dict_type;
	}
	public String getDict_item() {
		return dict_item;
	}
	public void setDict_item(String dict_item) {
		this.dict_item = dict_item;
	}
	public Long getDict_value() {
		return dict_value;
	}
	public void setDict_value(Long dict_value) {
		this.dict_value = dict_value;
	}
	public Integer getDict_is_editable() {
		return dict_is_editable;
	}
	public void setDict_is_editable(Integer dict_is_editable) {
		this.dict_is_editable = dict_is_editable;
	}
	
}
