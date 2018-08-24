package com.chaqi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JMPController {

    @RequestMapping("/login")
    public String login()
    {
        return "login";
    }
    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/userProfile")
    public String userProfile(){
        return "userProfile";
    }

    @RequestMapping("/roleAssign")
    public String roleAssign(){
        return "roleAssign";
    }

    @RequestMapping("/userInsert")
    public String userInsert(){
        return "userInsert";
    }

}
