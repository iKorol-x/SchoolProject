package com.skd.dao;

import com.skd.domain.SalaryData;

import java.util.List;

public interface SalaryDao {
    int insertSalary(SalaryData salaryData);
    List<SalaryData> selectSalary();
    int updateSalary(SalaryData salaryData);
    int deleteSalary(String name);
}
