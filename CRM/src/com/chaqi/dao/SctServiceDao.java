package com.chaqi.dao;

import com.chaqi.entity.CustomerServiceAnalysis;
import com.chaqi.entity.Sct_Service;

import java.util.List;
import java.util.Map;

public interface SctServiceDao {
    /**
     * 查询所有服务信息
     * @param map   参数集合
     * @return      返回服务信息列表
     */
    List<Sct_Service> selectSctAll(Map map);

    /**
     * 查询服务信息条数
     * @param map  参数集合
     * @return     返回服务信息条数
     */
    Long selectSctCount(Map map);

    /**
     * 添加服务信息
     * @param map   参数集合
     */
    void addSct(Map map);

    /**
     * 根据服务编号查询服务信息
     * @param id   服务编号
     * @return     返回服务信息对象
     */
    Sct_Service selectSctById(Long id);

    /**
     * 修改服务信息
     * @param map 参数数组
     */
    void updateSct(Map map);

    /**
     * 根据服务编号删除服务信息
     * @param id   服务编号
     */
    void delSct(Long id);

    /**
     * 修改分配人
     * @param map  参数数组
     */
    void updateSvr_due_to(Map map);
    /**
     * 客户服务分析
     * @return
     */
    List<CustomerServiceAnalysis> selectTypeAndCount(String startTime, String endTime);
}
