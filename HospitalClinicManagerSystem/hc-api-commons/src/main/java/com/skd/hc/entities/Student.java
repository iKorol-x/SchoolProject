package com.skd.hc.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {
    private Integer st_id;
    private Integer age;
    private String department;
    private String gender;
}
