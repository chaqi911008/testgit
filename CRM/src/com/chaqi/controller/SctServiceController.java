package com.chaqi.controller;

import com.chaqi.entity.Sct_Service;
import com.chaqi.entity.Sys_user;
import com.chaqi.service.impl.SctServiceImpl;
import com.chaqi.service.impl.UserServiceImpl;
import com.chaqi.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SctServiceController {
    @Autowired
    private SctServiceImpl sctService;
    @Autowired
    private UserServiceImpl userService;
    /**
     * 跳转到服务反馈页面
     * @param pageNow        当前页码
     * @param pageSize       每页显示的条数
     * @param svr_cust_name  客户名称
     * @param svr_title       服务概要
     * @param svr_type         服务类型
     * @param svr_create_date  创建时间
     * @param svr_create_date1 创建时间
     * @param svr_result        处理结果
     * @return
     */
    @RequestMapping("/serviceManage")
    public String serviceManage(String pageNow, String pageSize, String svr_cust_name, String svr_title,
                                String svr_type, String svr_create_date, String svr_create_date1, String svr_result, HttpServletRequest req){
        if(svr_result==null || svr_result==""){
            svr_result="已分配";
        }
        Page<Sct_Service> sct_servicePage = sctService.selectSctPage(pageNow, pageSize, svr_cust_name, svr_title, svr_type, svr_create_date, svr_create_date1, svr_result);
        req.setAttribute("sct_servicePage",sct_servicePage);
        //将参数放到request中用于模糊查询后的回显
        req.setAttribute("svr_cust_name",svr_cust_name);
        req.setAttribute("svr_title",svr_title);
        req.setAttribute("svr_type",svr_type);
        req.setAttribute("svr_create_date",svr_create_date);
        req.setAttribute("svr_create_date1",svr_create_date1);
        req.setAttribute("svr_result",svr_result);
        return "serviceManage";
    }

    /**
     * 进入到服务创建页面
     * @return
     */
    @RequestMapping("/serviceCreate")
    public String serviceCreate(){

        return "serviceCreate";
    }

    /**
     * 添加服务信息
     * @param svr_type       服务类型
     * @param svr_title      服务标题
     * @param svr_cust_name  客户名称
     * @param svr_request    服务请求
     * @param svr_create_by   创建人
     * @param svr_create_date 创建时间
     * @param svr_result       状态
     * @param svr_due_id       处理人
     * @param svr_due_date     处理时间
     * @return
     * @throws ParseException
     */
    @RequestMapping("/toServiceCreate")
    public String toServiceCreate(String svr_type,String svr_title,String svr_cust_name,
    String svr_request,String svr_create_by,String svr_create_date,String svr_result,Long svr_due_id,String svr_due_date) throws ParseException {
        Sys_user sys_user = userService.selectUserById(svr_due_id);
        String svr_due_to=sys_user.getUser_name();
        //将String格式转成Date类型
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
        Map map=new HashMap();
        map.put("svr_type",svr_type);
        map.put("svr_title",svr_title);
        map.put("svr_cust_name",svr_cust_name);
        map.put("svr_request",svr_request);
        map.put("svr_create_by",svr_create_by);
        map.put("svr_create_date",s.parse(svr_create_date));
        map.put("svr_result",svr_result);
        map.put("svr_due_to",svr_due_to);
        map.put("svr_due_date",s.parse(svr_due_date));
        sctService.addSct(map);
        return "redirect:serviceManage";
    }

    /**
     * 进入到服务分配
     * @param pageNow         当前页码
     * @param pageSize        每页显示的条数
     * @param svr_cust_name   客户名称
     * @param svr_title        服务标题
     * @param svr_type         服务类型
     * @param svr_create_date  创建时间
     * @param svr_create_date1 创建时间
     * @param svr_result        状态
     * @param req
     * @return
     */
    @RequestMapping("/serviceAssign")
    public String serviceAssign(String pageNow, String pageSize, String svr_cust_name, String svr_title,
                                String svr_type, String svr_create_date, String svr_create_date1, String svr_result, HttpServletRequest req){
        if(svr_result==null || svr_result==""){
            svr_result="新创建";
        }
        Page<Sct_Service> sct_servicePage = sctService.selectSctPage(pageNow, pageSize, svr_cust_name, svr_title, svr_type, svr_create_date, svr_create_date1, svr_result);
        req.setAttribute("sct_servicePage",sct_servicePage);
        //将参数放到request中用于模糊查询后的回显
        req.setAttribute("svr_cust_name",svr_cust_name);
        req.setAttribute("svr_title",svr_title);
        req.setAttribute("svr_type",svr_type);
        req.setAttribute("svr_create_date",svr_create_date);
        req.setAttribute("svr_create_date1",svr_create_date1);
        req.setAttribute("svr_result",svr_result);
        return "serviceAssign";
    }

    /**
     *
     * @param id
     * @param req
     * @return
     */
    @RequestMapping("/serviceLookup")
    public String serviceLookup(Long id,HttpServletRequest req){
        Sct_Service sct_service = sctService.selectSctById(id);
        req.setAttribute("sct_service",sct_service);
        return "serviceLookup";
    }

    /**
     * 进入到服务归档页面
     * @param pageNow           当前页码
     * @param pageSize           每页显示的条数
     * @param svr_cust_name      用户名称
     * @param svr_title           服务标题
     * @param svr_type             服务类型
     * @param svr_create_date      创建时间
     * @param svr_create_date1     创建时间
     * @param svr_result            状态
     * @param req
     * @return
     */
    @RequestMapping("/serviceDate")
    public String serviceDate(String pageNow, String pageSize, String svr_cust_name, String svr_title,
                                String svr_type, String svr_create_date, String svr_create_date1, String svr_result, HttpServletRequest req){
        Page<Sct_Service> sct_servicePage = sctService.selectSctPage(pageNow,pageSize,svr_cust_name,svr_title,svr_type,svr_create_date,svr_create_date1,svr_result);
        req.setAttribute("sct_servicePage",sct_servicePage);
        //将参数放到request中用于模糊查询后的回显
        req.setAttribute("svr_cust_name",svr_cust_name);
        req.setAttribute("svr_title",svr_title);
        req.setAttribute("svr_type",svr_type);
        req.setAttribute("svr_create_date",svr_create_date);
        req.setAttribute("svr_create_date1",svr_create_date1);
        req.setAttribute("svr_result",svr_result);
        return "serviceDate";
    }

    /**
     * 进入到服务具体查看页面
     * @param id     服务编号
     * @param req
     * @return
     */
    @RequestMapping("/serviceSct")
    public String serviceSct(Long id,HttpServletRequest req){
        Sct_Service sct_service = sctService.selectSctById(id);
        req.setAttribute("sct_service",sct_service);
        return "serviceSct";
    }

    /**
     * 服务处理
     * @param svr_id          服务编号
     * @param svr_deal        服务处理
     * @param svr_deal_by      处理人
     * @param svr_deal_date    处理时间
     * @param svr_result        状态
     * @param svr_satisfy       满意度
     * @return
     * @throws ParseException
     */
    @RequestMapping("/updateSct")
    public String updateSct(Long svr_id,String svr_deal,
     String svr_deal_by,String svr_deal_date,String svr_result,int svr_satisfy) throws ParseException {
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
        Map map=new HashMap();
        map.put("svr_id",svr_id);
        map.put("svr_deal_by",svr_deal_by);
        map.put("svr_deal",svr_deal);
        map.put("svr_deal_date",s.parse(svr_deal_date));
        map.put("svr_result",svr_result);
        map.put("svr_satisfy",svr_satisfy);
        sctService.updateSct(map);
        return "redirect:serviceManage";
    }

    /**
     * 删除服务（并不是真正删除，只是修改服务的状态）
     * @param svr_id   服务编号
     * @return
     */
    @RequestMapping("/delSct")
    public String delSct(Long svr_id){
        sctService.delSct(svr_id);
        return "redirect:serviceAssign";
    }
    @ResponseBody
    @RequestMapping("/update")
    public String update(Long svr_id,Long svr_due_id){
        Sys_user sys_user = userService.selectUserById(svr_due_id);
        String svr_due_to=sys_user.getUser_name();
        Map map=new HashMap();
        map.put("svr_id",svr_id);
        map.put("svr_due_id",svr_due_id);
        map.put("svr_due_to",svr_due_to);
        map.put("svr_result","已分配");
        sctService.updateSvr_due_to(map);
        return "true";
    }

    public SctServiceImpl getSctService() {
        return sctService;
    }

    public void setSctService(SctServiceImpl sctService) {
        this.sctService = sctService;
    }


    public UserServiceImpl getUserService() {
        return userService;
    }

    public void setUserService(UserServiceImpl userService) {
        this.userService = userService;
    }
}
