package com.chaqi.utils;


import java.util.List;

/**
 * 一页信息
 */
public class Page<T> {
	private Long pageNow;		//当前页码(根据用户的需求，默认是第一页)
	private Long pageSize;		//每页显示的信息条数(自定义)
	private Long count;			//总的信息条数(查询数据库)
	private Long pageCount;		//总的页数(计算而来)
	private List<T> list;		//一页信息数据
	public Long getPageNow() {
		return pageNow;
	}
	public void setPageNow(Long pageNow) {
		this.pageNow = pageNow;
	}
	public Long getPageSize() {
		return pageSize;
	}
	public void setPageSize(Long pageSize) {
		this.pageSize = pageSize;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Long getPageCount() {
		return pageCount;
	}
	public void setPageCount(Long pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
