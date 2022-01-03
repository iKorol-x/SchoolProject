package com.skd.hc.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClinicRegister {   //科室挂号
    private Integer cr_id;
    private Integer st_id;
    private Integer dc_id;
    private Date time_sc; //挂号时间
}
