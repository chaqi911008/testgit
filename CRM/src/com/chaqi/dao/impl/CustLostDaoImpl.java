package com.chaqi.dao.impl;

import com.chaqi.dao.CustLostDao;
import com.chaqi.entity.Cst_Lost;
import com.chaqi.mapper.CustLostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class CustLostDaoImpl implements CustLostDao {
    @Autowired
    private CustLostMapper custLostMapper;
    @Override
    public List<Cst_Lost> selectLostAll(Map map) {
        return custLostMapper.selectLostAll(map);
    }

    @Override
    public Long selectLostCount(Map map) {
        return custLostMapper.selectLostCount(map);
    }

    @Override
    public Cst_Lost selectLostById(Long id) {
        return custLostMapper.selectLostById(id);
    }

    @Override
    public void delLost(Long id) {
        custLostMapper.delLost(id);
    }

    @Override
    public void updateLost(Cst_Lost cst_lost) {
        custLostMapper.updateLost(cst_lost);
    }

    @Override
    public void addLost(Cst_Lost cst_lost) {
        custLostMapper.addLost(cst_lost);
    }

    @Override
    public Long selectLost(Map map) {
        return custLostMapper.selectLost(map);
    }


    public CustLostMapper getCustLostMapper() {
        return custLostMapper;
    }

    public void setCustLostMapper(CustLostMapper custLostMapper) {
        this.custLostMapper = custLostMapper;
    }
}
