package com.chaqi.controller;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.chaqi.entity.Sys_user;
import com.chaqi.service.impl.UserServiceImpl;
import com.chaqi.utils.GeetestLib;
import com.chaqi.utils.MD5Util;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserServiceImpl userService;

    /**
     * 登陆验证
     * @param loginname   登陆名
     * @param password    密码
     * @param req
     * @param resp
     * @param session
     * @return
     */
    @RequestMapping("/tologin")
    public String tologin(String loginname, String password, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws IOException {
        String pwd= MD5Util.MD5(password,"java");
        Sys_user user = userService.selectUserByName(loginname, pwd);
            if(user!=null){
                session.setAttribute("user",user);
                return "forward:index";
            }else {
                req.setAttribute("error","您输入的用户名或密码错误！");
                return "forward:login";
            }

    }

    /**
     * 退出登陆
     * @param req
     * @return
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpServletRequest req){
        //清空session域中的用户对象
        req.getSession().removeAttribute("user");
        return "forward:login";
    }
    public UserServiceImpl getUserService() {
        return userService;
    }

    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }

    /**
     * 分页显示用户信息
     * @param pageNow    当前页码
     * @param pageSize   每页显示的条数
     * @param userXX     用户姓名
     * @param user_role_id  用户的角色编号
     * @param req
     * @return
     */
    @RequestMapping("/userList")
    public String userList(String pageNow,String pageSize,String userXX,String user_role_id,HttpServletRequest req){
        /*Page<Sys_user> userPage = userService.selectUserPage(pageNow, pageSize);
        req.setAttribute("userPage",userPage);*/
        if(user_role_id!=null&&user_role_id.equals("0")){
            user_role_id="";
        }
        Page<Sys_user> userPage = userService.selectUser(pageNow, pageSize, userXX, user_role_id);
        req.setAttribute("userPage",userPage);
        req.setAttribute("user_role_id",user_role_id);
        req.setAttribute("userXX",userXX);
        return "userList";
    }

    /**
     * 进入修改页码
     * @param id   要修改的用户编号
     * @param req
     * @return
     */
    @RequestMapping("/userAssign")
    public String userAssign(Long id,HttpServletRequest req){
        Sys_user sys_user = userService.selectUserById(id);
        req.setAttribute("userAll",sys_user);
        return "userAssign";
    }

    /**
     * 真正实现修改
     * @param role_id   用户角色编号
     * @param user_id   用户编号
     * @param req
     * @return
     */
    @RequestMapping("/touserAssign")
    public String touserAssign(Long role_id,Long user_id,HttpServletRequest req){
        Map map=new HashMap();
        map.put("user_id",user_id);
        map.put("role_id",role_id);
        userService.updateById(map);
        return "forward:userAssign?id="+user_id;
    }

    /**
     * 删除用户信息
     * @param id   用户编号
     * @return
     */
    @RequestMapping("/delUser")
    public String delUser(Long id){
        userService.deleteUser(id);
        return "forward:userList?pageNow=1&pageSize=4";
    }

    /**
     * 添加用户信息
     * @param sys_user   jsp页码传过来的用户对象
     * @return
     */
    @RequestMapping("/toUserInsert")
    public String toUserInsert(Sys_user sys_user){
        userService.addUser(sys_user);
        return "forward:userList?pageNow=1&pageSize=4";
    }

    @ResponseBody
    @RequestMapping(value = "/selectUserName",method = RequestMethod.POST)
    public Object selectUserName(){
        List<Sys_user> sys_users = userService.selectUserName();
        return sys_users;
    }
}





