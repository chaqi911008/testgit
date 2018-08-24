package com.chaqi.utils;

import com.chaqi.entity.Sys_user;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 拦截器
 */
public class Interceptor  implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object o) throws Exception {
        //得到项目名
        String contextPath=req.getContextPath();
        System.out.println(contextPath);

        HttpSession session = req.getSession();
        Sys_user user = (Sys_user) session.getAttribute("user");
        if(user != null){
            return true;
        }
        resp.sendRedirect(contextPath+"/login");
        return false;			//表示不通过，终止
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
