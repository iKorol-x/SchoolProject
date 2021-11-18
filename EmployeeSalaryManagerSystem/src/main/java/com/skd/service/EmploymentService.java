package com.skd.service;

import com.skd.domain.Employment;

import java.util.List;

public interface EmploymentService {
    int addEmployment(Employment employment);
    List<Employment> querryEmployment();
    int modifyEmployment(Employment employment);
    int dropEmployment(String name);

}
