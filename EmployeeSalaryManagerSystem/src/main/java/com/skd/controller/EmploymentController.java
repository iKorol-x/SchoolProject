package com.skd.controller;

import com.skd.domain.Duty;
import com.skd.domain.Employment;
import com.skd.domain.SalaryData;
import com.skd.service.DutyService;
import com.skd.service.EmploymentService;
import com.skd.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmploymentController {
    @Autowired
    private EmploymentService Eservice;
    @Autowired
    private DutyService Dservice;
    @Autowired
    private SalaryService Sservice;

    DecimalFormat df;
    @ResponseBody
    @RequestMapping("/querryEmployee.do")
    public List<Employment> doQuerryEmployee(){
        List<Employment> employments = Eservice.querryEmployment();
        return employments;
    }
    @ResponseBody
    @RequestMapping("/findEmployee.do")
    public List<Employment> doFindEmployee(Integer id){
        List<Employment> employments=Eservice.querryEmployment();
        List<Employment> findEm=new ArrayList<>();
        for(Employment em:employments){
            if(id.equals(em.getId())){
                findEm.add(em);
            }
        }
        return findEm;
    }

    @RequestMapping("/addEmployee.do")
    public String doAddEmployee(String name,Integer age,
                                      Double basesalary,Integer workyear,
                                      Double allowance,Double salary,
                                      Integer attend_day){
        Employment employment = new Employment();
        employment.setName(name);
        employment.setAge(age);
        employment.setBasesalary(basesalary);
        employment.setWorkyear(workyear);
        Eservice.addEmployment(employment);
        Duty duty = new Duty();
        duty.setName(name);
        duty.setAttend_day(attend_day);
        df=new DecimalFormat("0.00");
        double rate = attend_day/30.0;
        rate=Double.parseDouble(df.format(rate));
        duty.setAttend_rate(rate);
        Dservice.addDuty(duty);
        SalaryData salaryData = new SalaryData();
        salaryData.setName(name);
        allowance=workyear*1000.0;
        salaryData.setAllowance(allowance);
        salaryData.setSalary(allowance+basesalary);
        Sservice.addSalary(salaryData);
        System.out.println(employment+"\n"+duty+"\n"+salaryData);
        return "redirect:/employee/indexskip.do";
    }

    @RequestMapping("/updateEmployee.do")
    public String doUpdateEmployee(Integer id,Integer age,
                                   Double basesalary,Integer workyear,
                                   Integer attend_day){
        //处理职工修改信息
        Employment employment= new Employment();
        employment.setId(id);
        employment.setAge(age);
        employment.setBasesalary(basesalary);
        employment.setWorkyear(workyear);
        String relname="";
        List<Employment> employments = Eservice.querryEmployment();
        for(Employment em: employments){
            if(id.equals(em.getId())){
                relname=em.getName();
            }
        }
        employment.setName(relname);
        Eservice.modifyEmployment(employment);
        //处理考勤修改信息
        df=new DecimalFormat("0.00");
        Duty duty = new Duty();
        duty.setName(relname);
        duty.setAttend_day(attend_day);
        double rate = attend_day/30.0;
        rate=Double.parseDouble(df.format(rate));
        duty.setAttend_rate(rate);
        Dservice.modifyDuty(duty);
        //处理薪资修改信息
        SalaryData salaryData = new SalaryData();
        salaryData.setName(relname);
        salaryData.setAllowance(workyear*1000.0);
        salaryData.setSalary(workyear*1000*basesalary);
        Sservice.updateSalary(salaryData);
        return "redirect:/employee/indexskip.do";
    }
    @RequestMapping("/delEmployee.do")
    public String doDelEmployee(String name){

        int resultE=Eservice.dropEmployment(name);
        /*List<Employment> employments = Eservice.querryEmployment();
        String relname="";
        for(Employment em:employments){
            if(name.equals(em.getName())){
                relname=em.getName();
            }
        }*/
        Dservice.dropDuty(name);
        Sservice.dropSalary(name);
        return "redirect:/employee/indexskip.do";
    }


    @RequestMapping("/indexskip.do")
    public  String doIndexSkip(){
        return "index";
    }

}
