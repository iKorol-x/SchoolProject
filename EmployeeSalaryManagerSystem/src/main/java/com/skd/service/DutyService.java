package com.skd.service;

import com.skd.domain.Duty;

import java.util.List;

public interface DutyService {
    int addDuty(Duty duty);
    List<Duty> querryDuty();
    int dropDuty(String name);
    int modifyDuty(Duty duty);
}
