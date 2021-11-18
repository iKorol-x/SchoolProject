package com.skd.controller;

import com.skd.domain.SalaryData;
import com.skd.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/salary")
public class SalaryDataController {

    @Autowired
    private SalaryService service;
    @ResponseBody
    @RequestMapping("/querySalary.do")
    public List<SalaryData> doQuerrySalary(){
        List<SalaryData> salaries = service.querrySalary();
        return salaries;
    }
    @ResponseBody
    @RequestMapping("/findSalary.do")
    public List<SalaryData> doFindSalary(Integer id){
        List<SalaryData> salaries = service.querrySalary();
        List<SalaryData> relsalary = new ArrayList<>();
        for(SalaryData salaryData:salaries){
            if(id.equals(salaryData.getId())){
                relsalary.add(salaryData);
            }
        }
        return relsalary;
    }

}
