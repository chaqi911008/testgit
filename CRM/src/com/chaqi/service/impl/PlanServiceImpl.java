package com.chaqi.service.impl;

import com.chaqi.dao.PlanDao;
import com.chaqi.entity.Sal_Chance;
import com.chaqi.entity.Sal_Plan;
import com.chaqi.service.PlanService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class PlanServiceImpl implements PlanService {
    @Autowired
    private PlanDao planDao;
    @Override
    public Page<Sal_Plan> selectPlanPage(String now, String size, String chc_cust_name, String chc_title, String chc_linkman) {
        Page<Sal_Plan> page=new Page<Sal_Plan>();
        Long pageNow=1L;
        if(now!=null){
            pageNow=Long.parseLong(now);
        }
        page.setPageNow(pageNow);
        Long pageSize= ConstSystem.PAGE_SIZE;
        if(size!=null){
            pageSize=Long.parseLong(size);
        }
        page.setPageSize(pageSize);
        Map map=new HashMap();
        map.put("chc_cust_name",chc_cust_name);
        map.put("chc_title",chc_title);
        map.put("chc_linkman",chc_linkman);
        map.put("pageNow",pageNow);
        map.put("pageSize",pageSize);
        Long count=planDao.selectPlanCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sal_Plan> list = planDao.selectPlanAll(map);
        page.setList(list);
        return page;
    }

    @Override
    public List<Sal_Plan> selectPlanById(Long id) {
        return planDao.selectPlanById(id);
    }

    @Override
    public void addPlan(Map map) {
        planDao.addPlan(map);
    }

    @Override
    public void delPlan(Long pla_id) {
        planDao.delPlan(pla_id);
    }

    @Override
    public void updatePlan(Map map) {
        planDao.updatePlan(map);
    }

    @Override
    public void updatePlanResult(Map map) {
        planDao.updatePlanResult(map);
    }


    public PlanDao getPlanDao() {
        return planDao;
    }

    public void setPlanDao(PlanDao planDao) {
        this.planDao = planDao;
    }
}
