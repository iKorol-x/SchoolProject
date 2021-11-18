package com.skd.controller;

import com.skd.domain.Duty;
import com.skd.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/duty")
public class DutyController {
    @Autowired
    private DutyService service;

    @RequestMapping("/queryDuties.do")
    @ResponseBody
    public List<Duty> doQueryDuties(){
        List<Duty> duties = service.querryDuty();
        return duties;
    }

    @RequestMapping("/findDuties.do")
    @ResponseBody
    public List<Duty> doFindDuties(String name){
        List<Duty> duties = service.querryDuty();
        List<Duty> relduty=new ArrayList<>();
        for (Duty duty:duties){
            if(name.equals(duty.getName())){
                relduty.add(duty);
            }
        }
        return relduty;
    }
    @RequestMapping("/updateDuties")
    public String doUpdateDuty(String name,Integer day){
        Duty duty = new Duty();
        duty.setName(name);
        duty.setAttend_day(day);
        DecimalFormat df= new DecimalFormat("0.00");
        double rate =day/30.0;
        rate=Double.parseDouble(df.format(rate));
        duty.setAttend_rate(rate);

        service.modifyDuty(duty);
        return "redirect:/duty/indexskip.do";

    }
    @RequestMapping("/indexskip.do")
    public  String doIndexSkip(){
        return "index";
    }

}
