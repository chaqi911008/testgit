package com.chaqi.mapper;

import com.chaqi.entity.Sys_user;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {


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
     * 查询所有用户的条数
     * @return   返回用户条数
     */
    Long selectUserCount();

    /**
     * 登陆验证
     * @param name  姓名
     * @param pwd   密码
     * @return      返回用户对象
     */
    Sys_user selectUserByName(@Param("user_name") String name, @Param("user_password") String pwd);

    /**
     * 根据用户姓名和角色编号查询用户信息
     * @param map   参数数组
     * @return      返回用户列表
     */
    List<Sys_user> selectUser(Map map);

    /**
     * 根据用户姓名和角色编号查询用户数量
     * @param map  参数集合
     * @return     返回用户数量
     */
    Long selectCountByName(Map map);

    void updateById(Map map);

    List<Sys_user> selectUserName();
}
