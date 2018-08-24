package com.chaqi.dao;

import com.chaqi.entity.Cst_Customer;
import com.chaqi.entity.CustomerCompositionAnalysis;

import java.util.List;
import java.util.Map;

public interface CustomerDao {
    /**
     * 查询所有客户信息
     * @param map   参数数组
     * @return      返回客户信息列表
     */
    List<Cst_Customer> selectCustomerAll(Map map);

    /**
     * 查询客户信息总条数
     * @param map 参数数组
     * @return    返回客户信息条数
     */
    Long selectCustomerCount(Map map);

    /**
     * 根据客户编号查询客户信息
     * @param id  客户编号
     * @return    返回客户信息
     */
    Cst_Customer selectCustomerById(Long id);

    /**
     * 根据客户编号修改状态
     * @param id
     */
    void updateCustomerStatus(Long id);

    /**
     * 修改客户信息
     * @param cst_customer  客户对象
     */
    void updateCst(Cst_Customer cst_customer);

    /**
     * 添加用户信息
     * @param cst_customer   用户对象
     */
    void addCustomer(Cst_Customer cst_customer);

    /**
     * 客户构成分析
     * @return
     */
    public List<CustomerCompositionAnalysis> selectDqAndCount();

}
