package com.chaqi.dao.impl;

import java.util.List;
import java.util.Map;

import com.chaqi.dao.DictDao;
import com.chaqi.entity.Bas_Dict;
import com.chaqi.mapper.DictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DictDaoImpl implements DictDao {
	@Autowired
	private DictMapper dictmapper;
	
	@Override
	public List<Bas_Dict> select(Map map) {
		// TODO Auto-generated method stub
		return dictmapper.select(map);
	}
	@Override
	public Long selectUserCount(Map map) {
		// TODO Auto-generated method stub
		return dictmapper.selectUserCount(map);
	}

	@Override
	public void dalete(Long id) {
		dictmapper.dalete(id);
	}

	@Override
	public List<Bas_Dict> selectAll() {
		return dictmapper.selectAll();
	}

}
