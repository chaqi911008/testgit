package com.chaqi.controller;

import com.chaqi.entity.Sys_Role;
import com.chaqi.service.impl.RoleServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
@Controller
public class RoleController {
    @Autowired
    private RoleServiceImpl roleService;

    /**
     * 进入到角色页面
     * @param pageNow     当前页码
     * @param pageSize    每页显示的条数
     * @param req
     * @return
     */
    @RequestMapping("/roleList")
    public String userList(String pageNow,String pageSize,HttpServletRequest req){
        Page<Sys_Role> rolePage = roleService.selectRolePage(pageNow, pageSize);
        req.setAttribute("rolePage",rolePage);
        return "roleList";
    }


    public RoleServiceImpl getRoleService() {
        return roleService;
    }

    public void setRoleService(RoleServiceImpl roleService) {
        this.roleService = roleService;
    }
}
