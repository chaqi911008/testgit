package com.chaqi.dao;

import com.chaqi.entity.Cst_Lost;

import java.util.List;
import java.util.Map;

public interface CustLostDao {
    /**
     * 查询所有客户流失信息
     * @param map   参数数组
     * @return      返回客户流失信息列表
     */
    List<Cst_Lost> selectLostAll(Map map);

    /**
     * 查询客户流失信息的总条数
     * @param map  参数数组
     * @return     返回客户流失条数
     */
    Long selectLostCount(Map map);

    /**
     * 根据客户流失编号查询客户流失信息
     * @param id   客户流失编号
     * @return     返回客户流失对象
     */
    Cst_Lost selectLostById(Long id);

    /**
     * 根据编号删除流失客户信息
     * @param id   流失客户编号
     */
    void delLost(Long id);

    /**
     * 修改流失客户信息
     * @param cst_lost  流失客户对象
     */
    void updateLost(Cst_Lost cst_lost);

    /**
     * 添加流失客户信息
     * @param cst_lost  流失客户对象
     */
    void addLost(Cst_Lost cst_lost);

    /**
     * 查询时间段的信息条数（用于图表分析）
     * @param map
     * @return
     */
    Long selectLost(Map map);
}
