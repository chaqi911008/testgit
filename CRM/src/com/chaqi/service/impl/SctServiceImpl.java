package com.chaqi.service.impl;

import com.chaqi.dao.SctServiceDao;
import com.chaqi.entity.CustomerServiceAnalysis;
import com.chaqi.entity.Sct_Service;
import com.chaqi.service.SctService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SctServiceImpl implements SctService {
    @Autowired
    private SctServiceDao sctServiceDao;
    @Override
    public Page<Sct_Service> selectSctPage(String now, String size,
     String svr_cust_name, String svr_title, String svr_type, String svr_create_date, String svr_create_date1, String svr_result) {
        Page<Sct_Service> page=new Page<Sct_Service>();
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
        map.put("svr_cust_name",svr_cust_name);
        map.put("svr_title",svr_title);
        map.put("svr_type",svr_type);
        map.put("svr_create_date",svr_create_date);
        map.put("svr_create_date1",svr_create_date1);
        map.put("svr_result",svr_result);
        Long count=sctServiceDao.selectSctCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sct_Service> list = sctServiceDao.selectSctAll(map);
        page.setList(list);
        return page;
    }

    @Override
    public void addSct(Map map) {
        sctServiceDao.addSct(map);
    }

    @Override
    public Sct_Service selectSctById(Long id) {
        return sctServiceDao.selectSctById(id);
    }

    @Override
    public void updateSct(Map map) {
        sctServiceDao.updateSct(map);
    }

    @Override
    public void delSct(Long id) {
        sctServiceDao.delSct(id);
    }

    @Override
    public void updateSvr_due_to(Map map) {
        sctServiceDao.updateSvr_due_to(map);
    }

    @Override
    public List<CustomerServiceAnalysis> selectTypeAndCount(String startTime, String endTime) {
        return sctServiceDao.selectTypeAndCount(startTime,endTime);
    }


    public SctServiceDao getSctServiceDao() {
        return sctServiceDao;
    }

    public void setSctServiceDao(SctServiceDao sctServiceDao) {
        this.sctServiceDao = sctServiceDao;
    }
}
