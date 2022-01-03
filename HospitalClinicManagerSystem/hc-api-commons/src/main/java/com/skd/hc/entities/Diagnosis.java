package com.skd.hc.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Diagnosis {    //诊断类
    private Integer dg_id;  //诊断ID
    private Integer cr_id;   //挂号ID
    private String dg_info;//诊断结果信息
    private String med_id_list;
}
