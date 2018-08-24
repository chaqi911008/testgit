package com.chaqi.service.impl;

import com.chaqi.dao.UserDao;
import com.chaqi.entity.Sys_user;
import com.chaqi.service.UserService;
import com.chaqi.utils.ConstSystem;
import com.chaqi.utils.MD5Util;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
    @Autowired(required = true)
    private UserDao userDao;


    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public void addUser(Sys_user user) {
        user.setUser_password(MD5Util.MD5(user.getUser_password(),"java"));
        userDao.addUser(user);
    }

    @Override
    public void deleteUser(Long id) {
        userDao.deleteUser(id);
    }

    @Override
    public void updateUser(Sys_user user) {
        userDao.updateUser(user);
    }

    @Override
    public Sys_user selectUserById(Long id) {
        return userDao.selectUserById(id);
    }

    @Override
    public Sys_user selectUserByName(String name, String pwd) {
        return userDao.selectUserByName(name,pwd);
    }

    @Override
    public Page<Sys_user> selectUser(String now, String size, String user_name, String user_role_id) {
        Page<Sys_user> page=new Page<Sys_user>();
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
        map.put("user_name",user_name);
        map.put("user_role_id",user_role_id);
        map.put("pageNow",pageNow);
        map.put("pageSize",pageSize);
        Long count= userDao.selectCountByName(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sys_user> list = userDao.selectUser(map);
        page.setList(list);
        return page;
    }

    @Override
    public void updateById(Map map) {
        userDao.updateById(map);
    }

    @Override
    public List<Sys_user> selectUserName() {
        return userDao.selectUserName();
    }

}
