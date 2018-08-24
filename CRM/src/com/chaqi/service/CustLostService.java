package com.chaqi.service;

import com.chaqi.entity.Cst_Lost;
import com.chaqi.utils.Page;

import java.util.Map;

public interface CustLostService {

    /**
     * 根据客户流失编号查询客户流失信息
     * @param id   客户流失编号
     * @return     返回客户流失对象
     */
    Cst_Lost selectLostById(Long id);

    /**
     * 分页查询流失客户信息
     * @param now          当前页码
     * @param size         每页显示的条数
     * @param lst_cust_name  客户名称
     * @param lst_status        客户状态
     * @return
     */
    Page<Cst_Lost> selectLostPage(String now,String size,String lst_cust_name,String lst_status);

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
