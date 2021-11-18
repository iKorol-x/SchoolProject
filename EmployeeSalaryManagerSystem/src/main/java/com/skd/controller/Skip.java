package com.skd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skip")
public class Skip {

    @RequestMapping("/addUser.do")
    public String doAddUser(){
        return "addUser";
    }
    @RequestMapping("/updateUser.do")
    public String doUpdateUser(){
        return "updateUser";
    }

    @RequestMapping("/addEmployee.do")
    public String doAddEmployee(){
        return "addEmployee";
    }
    @RequestMapping("/updateEmployee.do")
    public String doUpdateEmployee(){
        return "updateEmployee";
    }

    @RequestMapping("/totalInfo")
    public String doTotalInfo(){
        return "totalInfo";
    }
    @RequestMapping("/upload.do")
    public String doUpload(){
        return "upload";
    }

}
