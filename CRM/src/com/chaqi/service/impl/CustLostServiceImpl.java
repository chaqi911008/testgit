package com.chaqi.service.impl;

import com.chaqi.dao.CustLostDao;
import com.chaqi.entity.Cst_Lost;
import com.chaqi.service.CustLostService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustLostServiceImpl implements CustLostService {
    @Autowired
    private CustLostDao custLostDao;
    @Override
    public Cst_Lost selectLostById(Long id) {
        return custLostDao.selectLostById(id);
    }

    @Override
    public Page<Cst_Lost> selectLostPage(String now, String size,String lst_cust_name,String lst_status) {
        Page<Cst_Lost> page=new Page<Cst_Lost>();
        Long pageNow=1L;
        if(now !=null){
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
        map.put("lst_cust_name",lst_cust_name);
        map.put("lst_status",lst_status);
        Long count=custLostDao.selectLostCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Cst_Lost> list = custLostDao.selectLostAll(map);
        page.setList(list);
        return page;
    }

    @Override
    public void delLost(Long id) {
        custLostDao.delLost(id);
    }

    @Override
    public void updateLost(Cst_Lost cst_lost) {
        custLostDao.updateLost(cst_lost);
    }

    @Override
    public void addLost(Cst_Lost cst_lost) {
        custLostDao.addLost(cst_lost);
    }

    @Override
    public Long selectLost(Map map) {
        return custLostDao.selectLost(map);
    }


    public CustLostDao getCustLostDao() {
        return custLostDao;
    }

    public void setCustLostDao(CustLostDao custLostDao) {
        this.custLostDao = custLostDao;
    }
}
