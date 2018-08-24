package com.chaqi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chaqi.dao.DictDao;
import com.chaqi.entity.Bas_Dict;
import com.chaqi.service.Dictservice;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DictserviceImpl implements Dictservice {
	@Autowired
	private DictDao dictdao;

	@Override
	public List<Bas_Dict> select(Map map) {
		// TODO Auto-generated method stub
		return dictdao.select(map);
	}

	@Override
	public Long selectUserCount(Map map) {
		// TODO Auto-generated method stub
		return dictdao.selectUserCount(map);
	}

	@Override
	public Page<Bas_Dict> selectUserPage(String now, String size, String dict_type, String dict_item, String  dict_value) {
		Page<Bas_Dict> page=new Page<Bas_Dict>();
		Long pageNow=1L;
		if(now!=null) {
			pageNow=Long.parseLong(now);
		}
		page.setPageNow(pageNow);
		Long pageSize= ConstSystem.PAGE_SIZE;
		if(size!=null) {
			pageSize=Long.parseLong(size);
		}
		page.setPageSize(pageSize);
		Map map=new HashMap();
		map.put("dict_type", dict_type);
		map.put("dict_item", dict_item);
		map.put("dict_value", dict_value);
		map.put("pageNow", pageNow);
		map.put("pageSize", pageSize);
		Long count=dictdao.selectUserCount(map);
		page.setCount(count);
		Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
		page.setPageCount(pageCount);
		List<Bas_Dict> list = dictdao.select(map);
		page.setList(list);
		return page;
	}

	

	@Override
	public void dalete(Long id) {
		dictdao.dalete(id);
	}

	@Override
	public List<Bas_Dict> selectAll() {
		return dictdao.selectAll();
	}


}
