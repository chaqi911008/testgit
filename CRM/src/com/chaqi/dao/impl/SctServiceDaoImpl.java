package com.chaqi.dao.impl;

import com.chaqi.dao.SctServiceDao;
import com.chaqi.entity.CustomerServiceAnalysis;
import com.chaqi.entity.Sct_Service;
import com.chaqi.mapper.SctServiceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class SctServiceDaoImpl implements SctServiceDao {
    @Autowired
    private SctServiceMapper sctServiceMapper;
    @Override
    public List<Sct_Service> selectSctAll(Map map) {
        return sctServiceMapper.selectSctAll(map);
    }

    @Override
    public Long selectSctCount(Map map) {
        return sctServiceMapper.selectSctCount(map);
    }

    @Override
    public void addSct(Map map) {
        sctServiceMapper.addSct(map);
    }

    @Override
    public Sct_Service selectSctById(Long id) {
        return sctServiceMapper.selectSctById(id);
    }

    @Override
    public void updateSct(Map map) {
        sctServiceMapper.updateSct(map);
    }

    @Override
    public void delSct(Long id) {
        sctServiceMapper.delSct(id);
    }

    @Override
    public void updateSvr_due_to(Map map) {
        sctServiceMapper.updateSvr_due_to(map);
    }

    @Override
    public List<CustomerServiceAnalysis> selectTypeAndCount(String startTime, String endTime) {
        return sctServiceMapper.selectTypeAndCount(startTime,endTime);
    }


    public SctServiceMapper getSctServiceMapper() {
        return sctServiceMapper;
    }

    public void setSctServiceMapper(SctServiceMapper sctServiceMapper) {
        this.sctServiceMapper = sctServiceMapper;
    }
}
