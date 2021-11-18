package com.skd.controller;

import com.skd.domain.User;
import com.skd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService service;

    @RequestMapping("/login.do")
    public ModelAndView douUserLogin(@RequestParam("userId")String username,@RequestParam("userPwd") String password){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        List<User> userList =service.querryUser();
        for (User user:userList){
            if(username.equals(user.getUsername())){
                if(password.equals(user.getPassword())){
                    mv.addObject("username",username);
                    mv.addObject("password",password);
                    mv.addObject("priority",user.getPriority());
                    mv.setViewName("/index");
                }
            }
        }
        return mv;
    }


    @ResponseBody
    @RequestMapping("/findUser.do")
    public List<User> doFindUser(@RequestParam("userId") Integer id){
        List<User> users = service.querryUser();
        List<User> userOBJs = new ArrayList<>();
        for(User user:users){
            if(user.getId().equals(id)){
                userOBJs.add(user);
            }
        }
        return userOBJs;
    }

    @ResponseBody
    @RequestMapping("/queryUsers.do")
    public List<User> doQueryUsers(){
        List<User> users = service.querryUser();
        return users;
    }

    @RequestMapping("/updateUser.do")
    public String doUpdateUser(Integer userid,String username,String password,Integer priority){
        User user = new User();
        user.setId(userid);
        user.setUsername(username);
        user.setPassword(password);
        user.setPriority(priority);
        int result = service.modifyUser(user);

        return "redirect:/user/indexskip.do";
    }

    @RequestMapping("/deleteUser.do")
    public String doDeleteUser(Integer id){
        int result=service.dropUser(id);
        return "redirect:/user/indexskip.do";
    }
    @RequestMapping("/insertUser.do")
    public String doInsertUser(String username,String password,Integer priority){

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setPriority(priority);
//        System.out.println(username+"--"+password+"--"+priority);
        int result=service.addUser(user);
        return "redirect:/user/indexskip.do";
    }

    @RequestMapping("/indexskip.do")
    public  String doIndexSkip(){
        return "index";
    }



}
