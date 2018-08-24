package com.chaqi.service;

import com.chaqi.entity.Sal_Chance;
import com.chaqi.utils.Page;

import java.util.Map;

public interface SalChanceService {
    /**
     * 根据编号删除机会信息
     * @param id    机会编号
     */
    void delSalChanceById(Long id);

    /**
     * 添加机会信息
     * @param sal_chance    机会对象
     */
    void addSalChance(Sal_Chance sal_chance);

    /**
     * 根据编号查询机会信息
     * @param id  机会编号
     * @return    返回机会对象
     */
    Sal_Chance selectSalChanceById(Long id);

    Page<Sal_Chance> selectSalChancePage(String now,String size,String chc_cust_name,String chc_title,String chc_linkman);

    /**
     * 根据机会编号修改机会状态
     * @param map  参数数组
     */
    void updateSalChanceStatus(Map map);
}
