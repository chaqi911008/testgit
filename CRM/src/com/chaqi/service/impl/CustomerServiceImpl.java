package com.chaqi.service.impl;

import com.chaqi.dao.CustomerDao;
import com.chaqi.entity.Cst_Customer;
import com.chaqi.entity.CustomerCompositionAnalysis;
import com.chaqi.service.CustomerService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;
    public CustomerDao getCustomerDao() {
        return customerDao;
    }
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Override
    public Page<Cst_Customer> selectCustomerPage(String now, String size, String cust_name, String cust_level, String cust_status) {
        Page<Cst_Customer> page=new Page<Cst_Customer>();
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
        map.put("pageNow",pageNow);
        map.put("pageSize",pageSize);
        map.put("cust_name",cust_name);
        map.put("cust_level",cust_level);
        map.put("cust_status",cust_status);
        Long count=customerDao.selectCustomerCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Cst_Customer> list = customerDao.selectCustomerAll(map);
        page.setList(list);
        return page;
    }

    @Override
    public Cst_Customer selectCustomerById(Long id) {
        return customerDao.selectCustomerById(id);
    }

    @Override
    public void updateCustomerStatus(Long id) {
            customerDao.updateCustomerStatus(id);
    }

    @Override
    public void updateCst(Cst_Customer cst_customer) {
        customerDao.updateCst(cst_customer);
    }

    @Override
    public void addCustomer(Cst_Customer cst_customer) {
        customerDao.addCustomer(cst_customer);
    }

    @Override
    public List<CustomerCompositionAnalysis> selectDqAndCount() {
        return customerDao.selectDqAndCount();
    }
}
