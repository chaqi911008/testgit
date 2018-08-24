package com.chaqi.controller;

import com.chaqi.entity.Sal_Chance;
import com.chaqi.entity.Sal_Plan;
import com.chaqi.service.impl.PlanServiceImpl;
import com.chaqi.service.impl.SalChanceServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PlanController {
    @Autowired
    private PlanServiceImpl planService;
    @Autowired
    private SalChanceServiceImpl salChanceService;
    /**
     * 跳转到客户开发页面
     * @return
     */
    @RequestMapping("/plan")
    public String plan(String pageNow, String pageSize, String chc_cust_name, String chc_title, String chc_linkman, HttpServletRequest req){
        Page<Sal_Chance> salPlanPage = salChanceService.selectSalChancePage(pageNow, pageSize, chc_cust_name, chc_title, chc_linkman);
        req.setAttribute("sal_planPage",salPlanPage);
        req.setAttribute("chc_cust_name",chc_cust_name);
        req.setAttribute("chc_title",chc_title);
        req.setAttribute("chc_linkman",chc_linkman);
        return "plan";
    }

    /**
     * 跳转到制定计划页面
     * @return
     */
    @RequestMapping("/planFormulate")
    public String planFormulate(Long id,HttpServletRequest req){
        List<Sal_Plan> salPlanList = planService.selectPlanById(id);
        Sal_Chance salChance = salChanceService.selectSalChanceById(id);
        req.setAttribute("salPlanList",salPlanList);
        req.setAttribute("salChance",salChance);
        return "planFormulate";
    }
    @RequestMapping("/planExecute")
    public String planExecute(Long id,HttpServletRequest req){
        Sal_Chance salChanceById = salChanceService.selectSalChanceById(id);
        List<Sal_Plan> salPlanList = planService.selectPlanById(id);
        req.setAttribute("salPlanList",salPlanList);
        req.setAttribute("salChanceById",salChanceById);
        return "planExecute";
    }

    /**
     * 进入到查看页面
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("/planLookup")
    public String planLookup(Long id,HttpServletRequest req){
        List<Sal_Plan> salPlanList = planService.selectPlanById(id);
        Sal_Chance salChance = salChanceService.selectSalChanceById(id);
        req.setAttribute("salPlanList",salPlanList);
        req.setAttribute("salChance",salChance);
        return "planLookup";
    }

    /**
     * 添加计划
     * @param chc_id     计划编号
     * @param pla_date   计划时间
     * @param pla_todo   计划目标
     * @param req
     * @return
     * @throws ParseException
     */
    @RequestMapping("/addPlan")
    public String addPlan(Long chc_id,String pla_date,String pla_todo,HttpServletRequest req) throws ParseException {
        Map map=new HashMap();
        map.put("pla_chc_id",chc_id);
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
        map.put("pla_date",s.parse(pla_date));
        map.put("pla_todo",pla_todo);
        planService.addPlan(map);
        return "forward:planFormulate?id="+chc_id;
    }

    /**
     * 删除计划
     * @param pla_id   计划编号
     * @return
     */
    @ResponseBody
    @RequestMapping("/delPlan")
    public String delPlan(Long pla_id){
        planService.delPlan(pla_id);
        return "true";
    }

    /**
     * 修改计划
     * @param pla_id     计划编号
     * @param pla_todo  计划目标
     * @return
     */
    @ResponseBody
    @RequestMapping("/updatePlan")
    public String updatePlan(Long pla_id,String pla_todo){
        Map map=new HashMap();
        map.put("pla_id",pla_id);
        map.put("pla_todo",pla_todo);
        planService.updatePlan(map);
        return "true";
    }

    /**
     * 修改计划状态
     * @param pla_id       计划编号
     * @param pla_result   计划状态
     * @return
     */
    @ResponseBody
    @RequestMapping("/updatePlanResult")
    public String updatePlanResult(Long pla_id,String pla_result){
        Map map=new HashMap();
        map.put("pla_id",pla_id);
        map.put("pla_result",pla_result);
        planService.updatePlanResult(map);
        return "true";
    }

    public PlanServiceImpl getPlanService() {
        return planService;
    }

    public void setPlanService(PlanServiceImpl planService) {
        this.planService = planService;
    }


    public SalChanceServiceImpl getSalChanceService() {
        return salChanceService;
    }

    public void setSalChanceService(SalChanceServiceImpl salChanceService) {
        this.salChanceService = salChanceService;
    }
}
