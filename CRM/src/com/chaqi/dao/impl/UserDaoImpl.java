package com.chaqi.dao.impl;

import com.chaqi.dao.UserDao;
import com.chaqi.entity.Sys_user;
import com.chaqi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private UserMapper userMapper;

    @Override
    public void addUser(Sys_user user) {
        userMapper.addUser(user);
    }

    @Override
    public void deleteUser(Long id) {
        userMapper.deleteUser(id);
    }

    @Override
    public void updateUser(Sys_user user) {
        userMapper.updateUser(user);
    }

    @Override
    public Sys_user selectUserById(Long id) {

        return userMapper.selectUserById(id);
    }

    @Override
    public Long selectUserCount() {
        return userMapper.selectUserCount();
    }

    @Override
    public Sys_user selectUserByName(String name, String pwd) {

        return userMapper.selectUserByName(name,pwd);
    }

    @Override
    public List<Sys_user> selectUser(Map map) {
        return userMapper.selectUser(map);
    }

    @Override
    public Long selectCountByName(Map map) {
        return userMapper.selectCountByName(map);
    }

    @Override
    public void updateById(Map map) {
        userMapper.updateById(map);
    }

    @Override
    public List<Sys_user> selectUserName() {
        return userMapper.selectUserName();
    }


    public UserMapper getUserMapper() {
        return userMapper;
    }

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
}
