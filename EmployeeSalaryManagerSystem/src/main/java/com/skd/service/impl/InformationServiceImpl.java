package com.skd.service.impl;

import com.skd.dao.totalInfoDao;
import com.skd.domain.Information;
import com.skd.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class InformationServiceImpl implements InformationService {
    @Autowired
    private totalInfoDao totalInfoDao;
    @Override
    public List<Information> queryAllInformation() {
        List<Information> information = totalInfoDao.querryAllInfo();
        return information;
    }
}
