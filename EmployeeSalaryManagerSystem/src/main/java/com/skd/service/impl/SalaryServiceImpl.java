package com.skd.service.impl;

import com.skd.dao.SalaryDao;
import com.skd.domain.SalaryData;

import com.skd.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SalaryServiceImpl implements SalaryService {
    @Autowired
    private SalaryDao salaryDao;

    @Override
    public int addSalary(SalaryData salaryData) {
        int nums = salaryDao.insertSalary(salaryData);
        return nums;
    }

    @Override
    public List<SalaryData> querrySalary() {
        List<SalaryData> salaryData = salaryDao.selectSalary();
        return salaryData;
    }

    @Override
    public int dropSalary(String name) {
        int nums = salaryDao.deleteSalary(name);
        return nums;
    }

    @Override
    public int updateSalary(SalaryData salaryData) {
        int nums = salaryDao.updateSalary(salaryData);
        return nums;
    }
}
