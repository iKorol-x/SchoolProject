package com.skd.hc.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Medicine {
    private Integer med_id;
    private String med_name;
    private Integer med_inventory;//药物库存

}
