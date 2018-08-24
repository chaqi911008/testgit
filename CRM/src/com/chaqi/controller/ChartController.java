package com.chaqi.controller;

import com.alibaba.fastjson.JSON;
import com.chaqi.entity.CustomerCompositionAnalysis;
import com.chaqi.entity.CustomerServiceAnalysis;
import com.chaqi.entity.LostChart;
import com.chaqi.entity.Sct_Service;
import com.chaqi.service.impl.CustLostServiceImpl;
import com.chaqi.service.impl.CustomerServiceImpl;
import com.chaqi.service.impl.SctServiceImpl;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ChartController {
    @Autowired
    private CustLostServiceImpl lostService;
    @Autowired
    private CustomerServiceImpl customerService;
    @Autowired
    private SctServiceImpl sctService;

    /**
     * 客户流失人数图表
     * @param year
     * @param req
     * @return
     * @throws ParseException
     */
    @RequestMapping("/lostChart")
    public String lostChart(Integer year,HttpServletRequest req) throws ParseException {
        if(year==null){
            year = 2018;
        }

        req.setAttribute("year",year);
        int endYear = year-3;
        List<Map> data = new ArrayList<Map>();
        for(;year>endYear;year--){
            Map map = new HashMap();
            map.put("name", year);
            List list = new ArrayList();
            for(int i = 1 ; i <= 12 ; i++){
                String startTime = year+"-"+i+"-1";
                String endTime = year+"-"+(i+1)+"-1";
                if(i == 12){
                    endTime = (year+1)+"-"+1+"-1";
                }
                map.put("startTime",startTime);
                map.put("endTime",endTime);
                Long num = lostService.selectLost(map);
                if(num == null){
                    num = 0L;
                }
                list.add(num);
            }
            map.put("data", list);
            data.add(map);
        }
        req.setAttribute("data", JSON.toJSONString(data));
        return "lostChart";
    }

    /**
     * 客户地区分布图表
     * @param model
     * @return
     */
    @RequestMapping("/CustomerCompositionAnalysis")
    public String CustomerCompositionAnalysis(Model model){
        List<CustomerCompositionAnalysis> list = customerService.selectDqAndCount();
        //传值给前台
        List data = new ArrayList();
        Map map = new HashMap<>();
        map.put("type", "pie");
        map.put("name", "客户地区占比分析");
        map.put("url","http://bbs.hcharts.cn");
        List list1 = new ArrayList<>();
        for (CustomerCompositionAnalysis dqCount : list) {
            List l = new ArrayList<>();
            //得到地区
            l.add(dqCount.getCust_region());
            //得到人数
            l.add(dqCount.getCount());
            //放入到data中
            list1.add(l);
        }
        map.put("data", list1);
        data.add(map);
        model.addAttribute("data", JSON.toJSONString(data));
        return "CustomerCompositionAnalysis";
    }



    /**
     * 客户服务分析图表
     * @param model
     * @param year
     * @return
     */
    @RequestMapping("/CustomerServiceAnalysis")
    public String CustomerServiceAnalysis(Model model,Integer year){
        if(year == null){
            //表示是第一次访问
            year = 2018;
        }
        model.addAttribute("year",year);
        //传值给前台
        List<Map> data = new ArrayList<Map>();

        Map map1 = new HashMap();
        Map map2 = new HashMap();
        Map map3 = new HashMap();
        List list1 = new ArrayList<>();
        List list2 = new ArrayList();
        List list3 = new ArrayList();


        for(int i = 1 ; i <= 12 ; i++){
            String startTime = year+"-"+i+"-1";
            String endTime = year+"-"+(i+1)+"-1";
            if(i == 12){
                endTime = (year+1)+"-"+1+"-1";
            }
            List<CustomerServiceAnalysis> typeAndCount = sctService.selectTypeAndCount(startTime, endTime);

            if(typeAndCount.size() == 0){
                list1.add(0);
                list2.add(0);
                list3.add(0);
            }else{
                boolean a = false;
                boolean b = false;
                boolean c = false;
                for(int j = 1 ; j <= typeAndCount.size() ; j++){
                    if(typeAndCount.get(j-1).getSvr_type().equals("咨询")){
                        list1.add(typeAndCount.get(j-1).getCount());
                        a = true;
                    }

                    if(typeAndCount.get(j-1).getSvr_type().equals("建议")){
                        list2.add(typeAndCount.get(j-1).getCount());
                        b = true;
                    }

                    if(typeAndCount.get(j-1).getSvr_type().equals("投诉")){
                        list3.add(typeAndCount.get(j-1).getCount());
                        c = true;
                    }
                }
                if(a == false){
                    list1.add(0);
                }
                if(b == false){
                    list2.add(0);
                }
                if(c == false){
                    list3.add(0);
                }
            }

        }

        map1.put("name", "建议");
        map2.put("name", "咨询");
        map3.put("name", "投诉");

        map1.put("data", list1);
        map2.put("data", list2);
        map3.put("data", list3);

        data.add(map1);
        data.add(map2);
        data.add(map3);

        model.addAttribute("data",JSON.toJSONString(data));

        return "CustomerServiceAnalysis";
    }

}
