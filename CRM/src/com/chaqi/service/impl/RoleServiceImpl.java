package com.chaqi.service.impl;

import com.chaqi.dao.RoleDao;
import com.chaqi.entity.Sys_Role;
import com.chaqi.entity.Sys_user;
import com.chaqi.service.RoleService;
import com.chaqi.service.UserService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao roleDao;

    public RoleDao getRoleDao() {
        return roleDao;
    }

    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    public void addRole(Sys_Role role) {
        roleDao.addRole(role);
    }

    @Override
    public void delRole(Long id) {
        roleDao.delRole(id);
    }

    @Override
    public void updateRole(Sys_Role role) {
        roleDao.updateRole(role);
    }

    @Override
    public Page<Sys_Role> selectRolePage(String now, String size) {
        Page<Sys_Role> page=new Page<Sys_Role>();
        Long pageNow=1L;
        if(now!=null){
            pageNow=Long.parseLong(now);
        }
        page.setPageNow(pageNow);
        Long pageSize= ConstSystem.PAGE_SIZE;
        page.setPageSize(pageSize);
        Long count=roleDao.selectRoleCount();
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        Map map=new HashMap();
        map.put("pageNow",pageNow);
        map.put("pageSize",pageSize);
        List<Sys_Role> list = roleDao.selectRoleAll(map);
        page.setList(list);
        return page;
    }
}
