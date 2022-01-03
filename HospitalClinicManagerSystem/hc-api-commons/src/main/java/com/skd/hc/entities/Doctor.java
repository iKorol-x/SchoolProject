package com.skd.hc.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Doctor {
    private Integer dc_id;
    private Integer age;
    private String clinic;  //诊室
    private Integer access; //剩余号数
}
