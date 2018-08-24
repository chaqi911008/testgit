package com.chaqi.service;

import com.chaqi.entity.Sys_user;
import com.chaqi.utils.Page;

import java.util.List;
import java.util.Map;

public interface UserService {

    /**
     *添加用户信息
     * @param user  用户对象
     */
    void addUser(Sys_user user);

    /**
     * 删除用户
     * @param id  用户编号
     */
    void deleteUser(Long id);

    /**
     * 修改用户信息
     * @param user   用户对象
     */
    void updateUser(Sys_user user);

    /**
     * 根据用户编号查询用户对象
     * @param id  用户编号
     * @return    返回用户对象
     */
    Sys_user selectUserById(Long id);


    /**
     * 登陆验证
     * @param name  姓名
     * @param pwd   密码
     * @return      返回用户对象
     */
    Sys_user selectUserByName(String name, String pwd);

    Page<Sys_user> selectUser(String now,String size,String user_name,String user_role_id);


    void updateById(Map map);

    List<Sys_user> selectUserName();
}
