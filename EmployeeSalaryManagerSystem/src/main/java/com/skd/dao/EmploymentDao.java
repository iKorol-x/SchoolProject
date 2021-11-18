package com.skd.dao;

import com.skd.domain.Employment;

import java.util.List;

public interface EmploymentDao {
    int insertEmployment(Employment employment);
    List<Employment> selectEmployment();
    int deleteEmployment(String name);
    int updateEmployment(Employment employment);

}
