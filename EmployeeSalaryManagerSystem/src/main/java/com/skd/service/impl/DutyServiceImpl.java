package com.skd.service.impl;

import com.skd.dao.DutyDao;
import com.skd.domain.Duty;

import com.skd.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DutyServiceImpl implements DutyService {

    @Autowired
    DutyDao dutyDao;

    @Override
    public int addDuty(Duty duty) {
        int nums = dutyDao.insertDuty(duty);
        return nums;
    }

    @Override
    public List<Duty> querryDuty() {
        List<Duty> duties = dutyDao.selectDuty();
        return duties;
    }

    @Override
    public int dropDuty(String name) {
        int nums = dutyDao.deleteDuty(name);
        return nums;
    }


    @Override
    public int modifyDuty(Duty duty) {
        int nums = dutyDao.updateDuty(duty);
        return nums;
    }
}
