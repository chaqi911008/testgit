package com.chaqi.dao;

import com.chaqi.entity.Bas_Dict;

import java.util.List;
import java.util.Map;



public interface DictDao {
	public List<Bas_Dict> select(Map map);
	
	Long selectUserCount(Map map);
	
	public void dalete(Long id);

	List<Bas_Dict> selectAll();
}
