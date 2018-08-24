package com.chaqi.dao.impl;

import com.chaqi.dao.PlanDao;
import com.chaqi.entity.Sal_Plan;
import com.chaqi.mapper.PlanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class PlanDaoImpl implements PlanDao {
    @Autowired
    private PlanMapper planMapper;
    @Override
    public List<Sal_Plan> selectPlanAll(Map map) {
        return planMapper.selectPlanAll(map);
    }

    @Override
    public Long selectPlanCount(Map map) {
        return planMapper.selectPlanCount(map);
    }

    @Override
    public List<Sal_Plan> selectPlanById(Long id) {
        return planMapper.selectPlanById(id);
    }

    @Override
    public void addPlan(Map map) {
        planMapper.addPlan(map);
    }

    @Override
    public void delPlan(Long pla_id) {
        planMapper.delPlan(pla_id);
    }

    @Override
    public void updatePlan(Map map) {
        planMapper.updatePlan(map);
    }

    @Override
    public void updatePlanResult(Map map) {
        planMapper.updatePlanResult(map);
    }


    public PlanMapper getPlanMapper() {
        return planMapper;
    }

    public void setPlanMapper(PlanMapper planMapper) {
        this.planMapper = planMapper;
    }
}
