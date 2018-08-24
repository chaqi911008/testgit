package com.chaqi.controller;

import com.chaqi.entity.Cst_Customer;
import com.chaqi.entity.Cst_Lost;
import com.chaqi.entity.Sys_user;
import com.chaqi.service.impl.CustLostServiceImpl;
import com.chaqi.service.impl.CustomerServiceImpl;
import com.chaqi.service.impl.UserServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
public class CustomerController {
    @Autowired
    private CustomerServiceImpl customerService;
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private CustLostServiceImpl custLostService;
    /**
     * 进入到客户管理页面
     * @param pageNow      当前页码
     * @param pageSize      每页显示的条数
     * @param cust_name     客户名称
     * @param cust_level    客户等级
     * @param cust_status    客户状态
     * @param req
     * @return
     */
    @RequestMapping("/customer")
    public String customerList(String pageNow, String pageSize, String cust_name, String cust_level, String cust_status, HttpServletRequest req){
        Page<Cst_Customer> cst_customerPage = customerService.selectCustomerPage(pageNow, pageSize, cust_name, cust_level, cust_status);
        req.setAttribute("cst_customerPage",cst_customerPage);
        req.setAttribute("cust_name",cust_name);
        req.setAttribute("cust_level",cust_level);
        req.setAttribute("cust_status",cust_status);
        return "customer";
    }

    /**
     * 进入到查看客户详情页面
     * @param cust_no   客户编号
     * @param req
     * @return
     */
    @RequestMapping("/customerAssign")
    public String customerAssign(Long cust_no,HttpServletRequest req){
        Cst_Customer cst_customer = customerService.selectCustomerById(cust_no);
        req.setAttribute("cst_customer",cst_customer);
        return "customerAssign";
    }

    /**
     * 进入到添加客户页面
     * @return
     */
    @RequestMapping("/customerCreate")
    public String customerCreate(){
        return "customerCreate";
    }

    /**
     * 添加用户
     * @return
     */
    @RequestMapping("/toCustomerCreate")
    public String toCustomerCreate(Cst_Customer cst_customer){
        Sys_user sys_user = userService.selectUserById(cst_customer.getCust_manager_id());
        cst_customer.setCust_manager_name(sys_user.getUser_name());
        cst_customer.setCust_status("正常");
        customerService.addCustomer(cst_customer);
        return "redirect:customer";
    }

    /**
     * 修改客户状态
     * @param cust_no   客户编号
     * @return
     */
    @RequestMapping("/upCustomerStatus")
    public String upStatus(Long cust_no){
        customerService.updateCustomerStatus(cust_no);
        return "redirect:customer";
    }

    /**
     * 进入到修改客户页面
     * @param cust_no   客户编号
     * @param req
     * @return
     */
    @RequestMapping("/customerUp")
    public String upCustomer(Long cust_no,HttpServletRequest req){
        Cst_Customer cst_customer = customerService.selectCustomerById(cust_no);
        req.setAttribute("cst_customer",cst_customer);
        return "customerUp";
    }

    /**
     * 修改客户信息
     * @param cst_customer  客户对象
     * @return
     */
    @RequestMapping("/toUpCustomer")
    public String toUpCustomer(Cst_Customer cst_customer){
        switch (cst_customer.getCust_level()){
            case 1:
                cst_customer.setCust_level_label("普通用户");
                break;
            case 2:
                cst_customer.setCust_level_label("长期用户");
                break;
            case 3:
                cst_customer.setCust_level_label("VIP用户");
                break;
            case 4:
                cst_customer.setCust_level_label("高级VIP");
                break;
            case 5:
                cst_customer.setCust_level_label("超级VIP");
                break;
        }
        customerService.updateCst(cst_customer);
        if(cst_customer.getCust_status().equals("流失")){
            Cst_Lost cst_lost=new Cst_Lost();
            cst_lost.setLst_cust_no(cst_customer.getCust_no());
            cst_lost.setLst_cust_name(cst_customer.getCust_name());
            cst_lost.setLst_cust_manager_id(cst_customer.getCust_manager_id());
            cst_lost.setLst_cust_manager_name(cst_customer.getCust_manager_name());
            cst_lost.setLst_last_order_date(new Date());
            cst_lost.setLst_lost_date(new Date());
            cst_lost.setLst_status("警告");
            custLostService.addLost(cst_lost);
        }
        return "redirect:customer";
    }

    public CustomerServiceImpl getCustomerService() {
        return customerService;
    }

    public void setCustomerService(CustomerServiceImpl customerService) {
        this.customerService = customerService;
    }
}
