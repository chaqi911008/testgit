package com.chaqi.service;

import com.chaqi.entity.Sal_Plan;
import com.chaqi.utils.Page;

import java.util.List;
import java.util.Map;

public interface PlanService {
    Page<Sal_Plan> selectPlanPage(String now,String size,String chc_cust_name,String chc_title,String chc_linkman);

    /**
     * 根据编号查询计划信息
     * @param id    机会编号
     * @return      返回计划信息
     */
    List<Sal_Plan> selectPlanById(Long id);

    /**
     * 添加计划项
     * @param map  参数集合
     */
    void addPlan(Map map);

    /**
     * 根据计划编号删除计划
     * @param pla_id
     */
    void delPlan(Long pla_id);

    /**
     * 根据计划编号修改计划目标
     * @param map  参数数组
     */
    void updatePlan(Map map);

    /**
     * 根据计划编号修改计划结果
     * @param map
     */
    void updatePlanResult(Map map);
}
