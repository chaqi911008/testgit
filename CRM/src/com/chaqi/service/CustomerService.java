package com.chaqi.service;

import com.chaqi.entity.Cst_Customer;
import com.chaqi.entity.CustomerCompositionAnalysis;
import com.chaqi.utils.Page;

import java.util.List;
import java.util.Map;

public interface CustomerService {

    Page<Cst_Customer> selectCustomerPage(String now,String size,String cust_name,String cust_level,String cust_status);

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
    public void updateCst(Cst_Customer cst_customer);

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
