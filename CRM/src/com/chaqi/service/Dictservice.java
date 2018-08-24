package com.chaqi.service;

import com.chaqi.entity.Bas_Dict;
import com.chaqi.utils.Page;

import java.util.List;
import java.util.Map;



public interface Dictservice {
	public List<Bas_Dict> select(Map map);
	
	Long selectUserCount(Map map);
	
	Page<Bas_Dict> selectUserPage(String now, String size, String dict_type, String dict_item, String dict_value);
	

	
	public void dalete(Long id);

	List<Bas_Dict> selectAll();
}
