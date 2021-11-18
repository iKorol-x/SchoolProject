package com.skd.service;

import com.skd.domain.SalaryData;

import java.util.List;

public interface SalaryService {
    int addSalary(SalaryData salaryData);
    List<SalaryData> querrySalary();
    int dropSalary(String name);
    int updateSalary(SalaryData salaryData);
}
