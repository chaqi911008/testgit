package com.chaqi.service;

import com.chaqi.entity.Sys_Role;
import com.chaqi.utils.Page;

public interface RoleService {

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
     * 查询角色信息
     * @param now   当前页码
     * @param size  每页显示的条数
     * @return      返回一页信息
     */
    Page<Sys_Role> selectRolePage(String now,String size);
}
