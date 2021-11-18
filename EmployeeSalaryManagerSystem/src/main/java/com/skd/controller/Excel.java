package com.skd.controller;

import com.skd.domain.Duty;
import com.skd.domain.Employment;
import com.skd.domain.Information;
import com.skd.domain.SalaryData;
import com.skd.service.DutyService;
import com.skd.service.EmploymentService;
import com.skd.service.InformationService;
import com.skd.service.SalaryService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/excel")
public class Excel {
    @Autowired
    private InformationService informationService;


    @ResponseBody
    @RequestMapping("/queryAllInformation.do")
    public List<Information> doQueryInformation() {
        List<Information> information = informationService.queryAllInformation();
        return information;
    }


    @RequestMapping("/exportEmployeeInfo.do")
    public void exportEmpoyeeInfo(HttpServletResponse response) throws IOException {
        response.setCharacterEncoding("UTF-8");
        List<Information> list = informationService.queryAllInformation();
        //创建excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        //创建sheet页
        HSSFSheet sheet = wb.createSheet("员工信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("编号");
        titleRow.createCell(1).setCellValue("姓名");
        titleRow.createCell(2).setCellValue("年龄");
        titleRow.createCell(3).setCellValue("基本工资");
        titleRow.createCell(4).setCellValue("工作年限");
        titleRow.createCell(5).setCellValue("出勤天数");
        titleRow.createCell(6).setCellValue("出勤率");
        titleRow.createCell(7).setCellValue("津贴");
        titleRow.createCell(8).setCellValue("总工资");


        //遍历将数据放到excel列中
        for (Information information : list) {
            HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum() + 1);
            dataRow.createCell(0).setCellValue(information.getId());
            dataRow.createCell(1).setCellValue(information.getName());
            dataRow.createCell(2).setCellValue(information.getAge());
            dataRow.createCell(3).setCellValue(information.getBasesalary());
            dataRow.createCell(4).setCellValue(information.getWorkyear());
            dataRow.createCell(5).setCellValue(information.getAttend_day());
            dataRow.createCell(6).setCellValue(information.getAttend_rate());
            dataRow.createCell(8).setCellValue(information.getAllowance());
            dataRow.createCell(7).setCellValue(information.getSalary());

        }

                  /*   // 设置下载时客户端Excel的名称
             String filename =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + ".xls";
                response.setContentType("application/vnd.ms-excel");
                response.setHeader("Content-disposition", "attachment;filename=" + filename);  */

        // 设置下载时客户端Excel的名称   （上面注释的改进版本，上面的中文不支持）
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("职工薪资名单".getBytes(), "iso-8859-1") + ".xls");

        OutputStream ouputStream = response.getOutputStream();
        wb.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }

    @RequestMapping("/upload.do")
    public String Test(@RequestParam("file") MultipartFile file) throws IOException {
        //将file文件上传到硬盘中的某个位置
        InputStream input = file.getInputStream();
        String filename = file.getOriginalFilename();
        OutputStream out =new FileOutputStream("f:\\fileResource\\"+filename);
        byte[] bs = new byte[1024];
        int len =-1;
        while((len=input.read(bs)) !=-1) {
            out.write(bs,0,len);
        }
        System.out.println("上传成功");
        out.close();
        input.close();
        return "index";
    }

}
