package com.chaqi.dao.impl;

import com.chaqi.dao.CustomerDao;
import com.chaqi.entity.Cst_Customer;
import com.chaqi.entity.CustomerCompositionAnalysis;
import com.chaqi.mapper.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class CustomerDaoImpl implements CustomerDao {
    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public List<Cst_Customer> selectCustomerAll(Map map) {
        return customerMapper.selectCustomerAll(map);
    }

    @Override
    public Long selectCustomerCount(Map map) {
        return customerMapper.selectCustomerCount(map);
    }

    @Override
    public Cst_Customer selectCustomerById(Long id) {
        return customerMapper.selectCustomerById(id);
    }

    @Override
    public void updateCustomerStatus(Long id) {
            customerMapper.updateCustomerStatus(id);
    }

    @Override
    public void updateCst(Cst_Customer cst_customer) {
        customerMapper.updateCst(cst_customer);
    }

    @Override
    public void addCustomer(Cst_Customer cst_customer) {
        customerMapper.addCustomer(cst_customer);
    }

    @Override
    public List<CustomerCompositionAnalysis> selectDqAndCount() {
        return customerMapper.selectDqAndCount();
    }


    public CustomerMapper getCustomerMapper() {
        return customerMapper;
    }

    public void setCustomerMapper(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }
}
