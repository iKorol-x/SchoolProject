package com.skd.dao;

import com.skd.domain.Duty;

import java.util.List;

//@Resposity //创建dao对象
public interface DutyDao {
    int insertDuty(Duty duty);
    List<Duty> selectDuty();
    int updateDuty(Duty duty);
    int deleteDuty(String name);
}
