package com.chaqi.controller;

import com.chaqi.entity.Cst_Lost;
import com.chaqi.service.impl.CustLostServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CustLostController {
    @Autowired
    private CustLostServiceImpl custLostService;

    /**
     * 进入到流失客户页码
     * @param pageNow         当前页码
     * @param pageSize        每页显示的条数
     * @param lst_cust_name   流失的客户名称
     * @param lst_status      客户的状态
     * @param req
     * @return
     */
    @RequestMapping("/custLost")
    public String custLost(String pageNow, String pageSize, String lst_cust_name, String lst_status, HttpServletRequest req){
        Page<Cst_Lost> cst_lostPage = custLostService.selectLostPage(pageNow, pageSize, lst_cust_name, lst_status);
        req.setAttribute("cst_lostPage",cst_lostPage);
        req.setAttribute("lst_cust_name",lst_cust_name);
        req.setAttribute("lst_status",lst_status);
        return "custLost";
    }

    /**
     * 删除流失客户信息
     * @param lst_id
     * @return
     */
    @RequestMapping("/delLost")
    public String delLost(Long lst_id){
        custLostService.delLost(lst_id);
        return "redirect:custLost";
    }



    public CustLostServiceImpl getCustLostService() {
        return custLostService;
    }

    public void setCustLostService(CustLostServiceImpl custLostService) {
        this.custLostService = custLostService;
    }
}
