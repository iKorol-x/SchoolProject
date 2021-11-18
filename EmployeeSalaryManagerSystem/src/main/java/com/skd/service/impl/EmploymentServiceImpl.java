package com.skd.service.impl;

import com.skd.dao.EmploymentDao;
import com.skd.domain.Employment;
import com.skd.service.EmploymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmploymentServiceImpl implements EmploymentService {

    @Autowired
    private EmploymentDao employmentDao;
    @Override
    public int addEmployment(Employment employment) {
        int nums = employmentDao.insertEmployment(employment);
        return nums;
    }

    @Override
    public List<Employment> querryEmployment() {
        List<Employment> employments = employmentDao.selectEmployment();
        return employments;
    }

    @Override
    public int modifyEmployment(Employment employment) {
        int nums = employmentDao.updateEmployment(employment);
        return nums;
    }

    @Override
    public int dropEmployment(String name) {
        int nums = employmentDao.deleteEmployment(name);
        return nums;
    }
}
