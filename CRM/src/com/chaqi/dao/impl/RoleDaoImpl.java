package com.chaqi.dao.impl;

import com.chaqi.dao.RoleDao;
import com.chaqi.entity.Sys_Role;
import com.chaqi.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public class RoleDaoImpl implements RoleDao {
    @Autowired
    private RoleMapper roleMapper;
    @Override
    public List<Sys_Role> selectRoleAll(Map map) {
        return roleMapper.selectRoleAll(map);
    }

    @Override
    public void addRole(Sys_Role role) {
        roleMapper.addRole(role);
    }

    @Override
    public void delRole(Long id) {
        roleMapper.delRole(id);
    }

    @Override
    public void updateRole(Sys_Role role) {
        roleMapper.updateRole(role);
    }

    @Override
    public Long selectRoleCount() {
        return roleMapper.selectRoleCount();
    }


    public RoleMapper getRoleMapper() {
        return roleMapper;
    }

    public void setRoleMapper(RoleMapper roleMapper) {
        this.roleMapper = roleMapper;
    }
}
