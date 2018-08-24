package com.chaqi.controller;

import com.chaqi.entity.Sal_Chance;
import com.chaqi.entity.Sys_user;
import com.chaqi.service.impl.SalChanceServiceImpl;
import com.chaqi.service.impl.UserServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SalChanceController {
    @Autowired
    private SalChanceServiceImpl salChanceService;
    @Autowired
    private UserServiceImpl userService;

    /**
     * 进入到销售机会页面
     * @param pageNow        当前页码
     * @param pageSize       每页显示的条数
     * @param chc_cust_name  机会名称
     * @param chc_title       机会概要
     * @param chc_linkman     创建人
     * @param req
     * @return
     */
    @RequestMapping("/chance")
    public String chance(String pageNow, String pageSize, String chc_cust_name, String chc_title, String chc_linkman, HttpServletRequest req){
        Page<Sal_Chance> sal_chancePage = salChanceService.selectSalChancePage(pageNow, pageSize, chc_cust_name, chc_title, chc_linkman);
        req.setAttribute("sal_chancePage",sal_chancePage);
        req.setAttribute("chc_cust_name",chc_cust_name);
        req.setAttribute("chc_title",chc_title);
        req.setAttribute("chc_linkman",chc_linkman);
        return "chance";
    }

    /**
     * 进入到添加机会页面
     * @return
     */
    @RequestMapping("/chanceManage")
    public String chanceManage(){
        return "chanceManage";
    }

    /**
     * 添加机会
     * @param chc_source        机会来源
     * @param chc_cust_name     客户名称
     * @param chc_title         机会概要
     * @param chc_rate          成功率
     * @param chc_linkman       联系人
     * @param chc_tel           联系电话
     * @param chc_desc          机会描述
     * @param chc_create_id     创建机会编号
     * @param chc_create_by     机会创建人
     * @param chc_create_date   创建时间
     * @param chc_due_id        机会处理编号
     * @param chc_due_date      处理时间
     * @return
     * @throws ParseException
     */
    @RequestMapping(value = "/toChanceManage",method = RequestMethod.GET)
    public String toChanceManage(String chc_source, String chc_cust_name, String chc_title, int chc_rate,
                                 String chc_linkman, String chc_tel, String chc_desc, Long chc_create_id,
                                 String chc_create_by,String chc_create_date, Long chc_due_id,String chc_due_date) throws ParseException {
        Sal_Chance sal_chance=new Sal_Chance();
        sal_chance.setChc_source(chc_source);
        sal_chance.setChc_cust_name(chc_cust_name);
        sal_chance.setChc_title(chc_title);
        sal_chance.setChc_rate(chc_rate);
        sal_chance.setChc_linkman(chc_linkman);
        sal_chance.setChc_tel(chc_tel);
        sal_chance.setChc_desc(chc_desc);
        sal_chance.setChc_create_id(chc_create_id);
        sal_chance.setChc_create_by(chc_create_by);
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
        sal_chance.setChc_create_date(s.parse(chc_create_date));
        sal_chance.setChc_due_id(chc_due_id);
        Sys_user sysUser = userService.selectUserById(chc_due_id);
        sal_chance.setChc_due_to(sysUser.getUser_name());
        sal_chance.setChc_due_date(s.parse(chc_due_date));
        sal_chance.setChc_status(1);
        salChanceService.addSalChance(sal_chance);
        return "redirect:chance";
    }

    /**
     * 进入到机会详情页面
     * @param id        机会编号
     * @param chaxun   前台传过来的路径（做判断用）
     * @param req
     * @return
     */
    @RequestMapping("/chanceAssign")
    public String chanceAssign(Long id,String chaxun,HttpServletRequest req){
        Sal_Chance sal_chance = salChanceService.selectSalChanceById(id);
        req.setAttribute("sal_chance",sal_chance);
        req.setAttribute("chaxun",chaxun);
        return "chanceAssign";
    }

    /**
     * 修改机会
     * @param id  机会编号
     * @param chaxun  前台传过来的路径（做判断用）
     * @param req
     * @return
     */
    @RequestMapping("/upChanceAssign")
    public String upChanceAssign(Long id,String chaxun,HttpServletRequest req){
        Sal_Chance sal_chance = salChanceService.selectSalChanceById(id);
        req.setAttribute("sal_chance",sal_chance);
        req.setAttribute("chaxun",chaxun);
        return "chanceAssign";
    }

    /**
     * ajax显示用户名称
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/selUserName",method = RequestMethod.POST)
    public Object selUserName(){
        List<Sys_user> sys_users = userService.selectUserName();
        return sys_users;
    }

    /**
     * 修改机会状态
     * @param id       机会编号
     * @param chc_status   机会状态
     * @return
     */
    @RequestMapping("/upChanceAssignStatus")
    public String upChanceAssignStatus(Long id,int chc_status){
        Map map=new HashMap();
        map.put("chc_id",id);
        map.put("chc_status",chc_status);
        salChanceService.updateSalChanceStatus(map);
        if(chc_status==3){
            return "forward:chance";
        }
        return "forward:plan";
    }

    /**
     * 修改机会状态
     * @param chc_id  机会编号
     * @return
     */
    @ResponseBody
    @RequestMapping("/upStatus")
    public String upStatus(Long chc_id){
        Map map=new HashMap();
        map.put("chc_id",chc_id);
        map.put("chc_status",3);
        salChanceService.updateSalChanceStatus(map);
        return "true";
    }

    public SalChanceServiceImpl getSalChanceService() {
        return salChanceService;
    }

    public void setSalChanceService(SalChanceServiceImpl salChanceService) {
        this.salChanceService = salChanceService;
    }


    public UserServiceImpl getUserService() {
        return userService;
    }

    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }
}
