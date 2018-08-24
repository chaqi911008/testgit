package com.chaqi.dao.impl;

import com.chaqi.dao.SalChanceDao;
import com.chaqi.entity.Sal_Chance;
import com.chaqi.mapper.SalChanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class SalChanceDaoImpl implements SalChanceDao{
    @Autowired
    private SalChanceMapper salChanceMapper;
    @Override
    public List<Sal_Chance> selectSalChanceAll(Map map) {
        return salChanceMapper.selectSalChanceAll(map);
    }

    @Override
    public void delSalChanceById(Long id) {
        salChanceMapper.delSalChanceById(id);
    }

    @Override
    public void addSalChance(Sal_Chance sal_chance) {
            salChanceMapper.addSalChance(sal_chance);
    }

    @Override
    public Sal_Chance selectSalChanceById(Long id) {
        return salChanceMapper.selectSalChanceById(id);
    }

    @Override
    public Long selectSalChanceCount(Map map) {
        return salChanceMapper.selectSalChanceCount(map);
    }

    @Override
    public void updateSalChanceStatus(Map map) {
        salChanceMapper.updateSalChanceStatus(map);
    }


    public SalChanceMapper getSalChanceMapper() {
        return salChanceMapper;
    }

    public void setSalChanceMapper(SalChanceMapper salChanceMapper) {
        this.salChanceMapper = salChanceMapper;
    }
}
