package com.chaqi.service.impl;

import com.chaqi.dao.SalChanceDao;
import com.chaqi.entity.Sal_Chance;
import com.chaqi.service.SalChanceService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SalChanceServiceImpl implements SalChanceService {
    @Autowired
    private SalChanceDao salChanceDao;
    @Override
    public void delSalChanceById(Long id) {
        salChanceDao.delSalChanceById(id);
    }

    @Override
    public void addSalChance(Sal_Chance sal_chance) {
        salChanceDao.addSalChance(sal_chance);
    }

    @Override
    public Sal_Chance selectSalChanceById(Long id) {
        return salChanceDao.selectSalChanceById(id);
    }

    @Override
    public Page<Sal_Chance> selectSalChancePage(String now, String size, String chc_cust_name, String chc_title, String chc_linkman) {
        Page<Sal_Chance> page=new Page<Sal_Chance>();
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
        map.put("chc_cust_name",chc_cust_name);
        map.put("chc_title",chc_title);
        map.put("chc_linkman",chc_linkman);
        map.put("pageNow",pageNow);
        map.put("pageSize",pageSize);
        Long count=salChanceDao.selectSalChanceCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sal_Chance> list = salChanceDao.selectSalChanceAll(map);
        page.setList(list);
        return page;
    }

    @Override
    public void updateSalChanceStatus(Map map) {
        salChanceDao.updateSalChanceStatus(map);
    }


    public SalChanceDao getSalChanceDao() {
        return salChanceDao;
    }

    public void setSalChanceDao(SalChanceDao salChanceDao) {
        this.salChanceDao = salChanceDao;
    }
}
