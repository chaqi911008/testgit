package com.chaqi.dao;

import com.chaqi.entity.Sys_Role;
import com.chaqi.entity.Sys_right;
import org.apache.ibatis.annotations.Delete;

import java.util.List;
import java.util.Map;

public interface RoleDao {
    /**
     * 查询所有角色信息
     * @param map   参数集合
     * @return      返回角色信息列表
     */
    List<Sys_Role> selectRoleAll(Map map);

    /**
     * 添加角色信息
     * @param role   角色对象
     */
    void addRole(Sys_Role role);

    /**
     * 删除角色信息
     * @param id   角色编号
     */
    void delRole(Long id);

    /**
     * 修改角色信息
     * @param role   角色对象
     */
    void updateRole(Sys_Role role);

    /**
     * 查询角色条数
     * @return    返回数据条数
     */
    Long selectRoleCount();
}
